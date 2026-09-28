extends KinematicBody2D

# W01 Signal-9 va W02 Needle avtomati (6.1-jadval) + o'yinchi asosiy
# qiymatlari (5.2-bo'lim).

const WEAPONS := {
	"W01": {"name": "Signal-9", "dmg": 24.0, "rate": 3.0, "mag": 12, "reload": 1.4, "range": 400.0, "max_range": 600.0, "noise": 420.0},
	"W02": {"name": "Needle", "dmg": 12.0, "rate": 8.0, "mag": 24, "reload": 1.8, "range": 320.0, "max_range": 480.0, "noise": 500.0},
}
const RAY_MASK := 1 | 4

const WALK_SPEED := 220.0
const RUN_SPEED := 340.0
const ENCUMBERED_SPEED := 180.0
const RUN_STAMINA_COST := 18.0
const STAMINA_REGEN := 25.0
const STAMINA_REGEN_DELAY := 0.8

const DODGE_DISTANCE := 110.0
const DODGE_DURATION := 0.24
const DODGE_STAMINA_COST := 30.0
const DODGE_COOLDOWN := 0.7

const RESOURCE_SCENE := preload("res://scenes/ResourcePickup.tscn")
const SPECIALIST_SCENE := preload("res://scenes/Specialist.tscn")

var health := 100.0
var max_health := 100.0
var stamina := 100.0
var max_stamina := 100.0
var _stamina_idle_timer := 0.0

var current_weapon := "W01"
var ammo := {"W01": 12, "W02": 24}
var reloading := false
var _reload_timer := 0.0
var _fire_cooldown := 0.0

var carrying_cargo := false
var is_dead := false
var aim_angle := 0.0

var _dodging := false
var _dodge_timer := 0.0
var _dodge_dir := Vector2.ZERO
var _dodge_cooldown := 0.0
var _space_was_down := false

signal died

func _ready() -> void:
	add_to_group("player")
	carrying_cargo = GameState.is_carrying()
	update()

func _physics_process(delta: float) -> void:
	if is_dead:
		return

	_handle_aim()
	_handle_movement(delta)
	_handle_weapon_switch()
	_handle_shooting(delta)
	_handle_drop()
	update()

func _handle_aim() -> void:
	var mouse_pos := get_global_mouse_position()
	aim_angle = (mouse_pos - global_position).angle()

func _handle_movement(delta: float) -> void:
	var input_vector := Vector2.ZERO
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		input_vector.y -= 1
	input_vector = input_vector.normalized()

	_update_dodge(delta, input_vector)
	if _dodging:
		move_and_slide(_dodge_dir * (DODGE_DISTANCE / DODGE_DURATION))
		return

	var running := Input.is_key_pressed(KEY_SHIFT) and not carrying_cargo \
		and input_vector != Vector2.ZERO and stamina > 0.0

	var speed := WALK_SPEED
	if carrying_cargo:
		speed = ENCUMBERED_SPEED
	elif running:
		speed = RUN_SPEED

	move_and_slide(input_vector * speed)

	if running:
		stamina = max(0.0, stamina - RUN_STAMINA_COST * delta)
		_stamina_idle_timer = 0.0
	else:
		_stamina_idle_timer += delta
		if _stamina_idle_timer >= STAMINA_REGEN_DELAY:
			stamina = min(max_stamina, stamina + STAMINA_REGEN * delta)

func _update_dodge(delta: float, input_vector: Vector2) -> void:
	# Qochish qadami (5.2): 110 birlik/0,24 s, 30 chidamlilik, 0,7 s
	# oralig'i. Standartda mutlaq daxlsizlik yo'q — faqat qayta joylashish.
	if _dodge_cooldown > 0.0:
		_dodge_cooldown -= delta

	var space_down := Input.is_key_pressed(KEY_SPACE)
	var just_pressed := space_down and not _space_was_down
	_space_was_down = space_down

	if _dodging:
		_dodge_timer -= delta
		if _dodge_timer <= 0.0:
			_dodging = false
		return

	if just_pressed and not carrying_cargo and _dodge_cooldown <= 0.0 and stamina >= DODGE_STAMINA_COST:
		var dir := input_vector
		if dir == Vector2.ZERO:
			dir = Vector2(1.0, 0.0).rotated(aim_angle)
		_dodge_dir = dir.normalized()
		_dodging = true
		_dodge_timer = DODGE_DURATION
		_dodge_cooldown = DODGE_COOLDOWN
		stamina = max(0.0, stamina - DODGE_STAMINA_COST)

func _handle_weapon_switch() -> void:
	if reloading:
		return
	if Input.is_key_pressed(KEY_1) and current_weapon != "W01":
		current_weapon = "W01"
	elif Input.is_key_pressed(KEY_2) and current_weapon != "W02":
		current_weapon = "W02"

func _handle_shooting(delta: float) -> void:
	if carrying_cargo or _dodging:
		return

	var w: Dictionary = WEAPONS[current_weapon]

	if reloading:
		_reload_timer -= delta
		if _reload_timer <= 0.0:
			reloading = false
			ammo[current_weapon] = w.mag
		return

	if _fire_cooldown > 0.0:
		_fire_cooldown -= delta

	if Input.is_key_pressed(KEY_R) and ammo[current_weapon] < w.mag:
		reloading = true
		_reload_timer = w.reload
		return

	if Input.is_mouse_button_pressed(BUTTON_LEFT) and _fire_cooldown <= 0.0 and ammo[current_weapon] > 0:
		_fire(w)
		_fire_cooldown = 1.0 / w.rate

func _fire(w: Dictionary) -> void:
	ammo[current_weapon] -= 1
	var from := global_position
	var dir := Vector2(1.0, 0.0).rotated(aim_angle)
	var to: Vector2 = from + dir * w.max_range
	var space_state := get_world_2d().direct_space_state
	var result := space_state.intersect_ray(from, to, [self], RAY_MASK)
	NoiseManager.emit_noise(from, w.noise)
	if result and result.collider.has_method("take_damage"):
		var dist: float = from.distance_to(result.position)
		var falloff := 1.0
		if dist > w.range:
			var t: float = clamp((dist - w.range) / (w.max_range - w.range), 0.0, 1.0)
			falloff = lerp(1.0, 0.6, t)
		result.collider.take_damage(w.dmg * falloff, from)

func _handle_drop() -> void:
	if not (carrying_cargo and Input.is_key_pressed(KEY_G)):
		return
	var carrying = GameState.carrying
	if carrying == null:
		return
	carrying_cargo = false
	var drop_pos: Vector2 = global_position + Vector2(0.0, 34.0)
	if carrying.type == "resource":
		var pickup = RESOURCE_SCENE.instance()
		pickup.kind = carrying.kind
		pickup.amount = carrying.amount
		pickup.is_primary = carrying.get("is_primary", false)
		get_parent().add_child(pickup)
		pickup.global_position = drop_pos
	elif carrying.type == "person":
		var person = SPECIALIST_SCENE.instance()
		person.person_id = carrying.id
		get_parent().add_child(person)
		person.global_position = drop_pos
	GameState.drop_carrying()
	GameState.log_event("Yuk qo'yildi.")

func take_damage(amount: float) -> void:
	if is_dead:
		return
	health = max(0.0, health - amount)
	if health <= 0.0:
		is_dead = true
		emit_signal("died")
		GameState.log_event("O'yinchi yiqildi.")

func _draw() -> void:
	draw_circle(Vector2.ZERO, 14.0, Color(0.15, 0.15, 0.18))
	draw_circle(Vector2.ZERO, 12.0, Color(0.7, 0.75, 0.8))
	var tip := Vector2(24.0, 0.0).rotated(aim_angle)
	draw_line(Vector2.ZERO, tip, Color(1.0, 0.85, 0.3), 3.0)
