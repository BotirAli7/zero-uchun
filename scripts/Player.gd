extends KinematicBody2D

# W01 Signal-9 to'pponcha va o'yinchi asosiy qiymatlari (5.2 va 6.1-jadval).

const WEAPON_DAMAGE := 24.0
const WEAPON_FIRE_RATE := 3.0
const WEAPON_MAG_SIZE := 12
const WEAPON_RELOAD_TIME := 1.4
const WEAPON_RANGE := 400.0
const WEAPON_MAX_RANGE := 600.0
const WEAPON_NOISE_RADIUS := 420.0
const RAY_MASK := 1 | 4

const WALK_SPEED := 220.0
const RUN_SPEED := 340.0
const ENCUMBERED_SPEED := 180.0
const RUN_STAMINA_COST := 18.0
const STAMINA_REGEN := 25.0
const STAMINA_REGEN_DELAY := 0.8

var health := 100.0
var max_health := 100.0
var stamina := 100.0
var max_stamina := 100.0
var _stamina_idle_timer := 0.0

var ammo := WEAPON_MAG_SIZE
var reloading := false
var _reload_timer := 0.0
var _fire_cooldown := 0.0

const CARGO_SCENE := preload("res://scenes/Cargo.tscn")

var carrying_cargo := false
var is_dead := false
var aim_angle := 0.0

signal died

func _ready() -> void:
	add_to_group("player")
	carrying_cargo = GameState.carrying_cargo
	update()

func _physics_process(delta: float) -> void:
	if is_dead:
		return

	_handle_aim()
	_handle_movement(delta)
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

func _handle_shooting(delta: float) -> void:
	if carrying_cargo:
		return

	if reloading:
		_reload_timer -= delta
		if _reload_timer <= 0.0:
			reloading = false
			ammo = WEAPON_MAG_SIZE
		return

	if _fire_cooldown > 0.0:
		_fire_cooldown -= delta

	if Input.is_key_pressed(KEY_R) and ammo < WEAPON_MAG_SIZE:
		reloading = true
		_reload_timer = WEAPON_RELOAD_TIME
		return

	if Input.is_mouse_button_pressed(BUTTON_LEFT) and _fire_cooldown <= 0.0 and ammo > 0:
		_fire()
		_fire_cooldown = 1.0 / WEAPON_FIRE_RATE

func _fire() -> void:
	ammo -= 1
	var from := global_position
	var dir := Vector2(1.0, 0.0).rotated(aim_angle)
	var to := from + dir * WEAPON_MAX_RANGE
	var space_state := get_world_2d().direct_space_state
	var result := space_state.intersect_ray(from, to, [self], RAY_MASK)
	NoiseManager.emit_noise(from, WEAPON_NOISE_RADIUS)
	if result and result.collider.has_method("take_damage"):
		var dist: float = from.distance_to(result.position)
		var falloff := 1.0
		if dist > WEAPON_RANGE:
			var t: float = clamp((dist - WEAPON_RANGE) / (WEAPON_MAX_RANGE - WEAPON_RANGE), 0.0, 1.0)
			falloff = lerp(1.0, 0.6, t)
		result.collider.take_damage(WEAPON_DAMAGE * falloff)

func _handle_drop() -> void:
	if carrying_cargo and Input.is_key_pressed(KEY_G):
		carrying_cargo = false
		GameState.carrying_cargo = false
		GameState.log_event("Yuk qo'yildi.")
		var cargo = CARGO_SCENE.instance()
		get_parent().add_child(cargo)
		cargo.global_position = global_position + Vector2(0.0, 34.0)

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
