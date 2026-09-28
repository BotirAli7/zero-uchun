extends Area2D

# A hazard spawned at random by Main.gd. Drains oxygen/hull while active.
# The player must stand inside and hold E for repair_time seconds to fix it.

const BREACH_TEXTURE := preload("res://assets/breach.png")

export var repair_time := 3.5
export var radius := 26.0

var player_in_range := false
var repair_progress := 0.0
var _repaired := false
var _e_hint: Label
var _sprite: Sprite

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

	var shape := CircleShape2D.new()
	shape.radius = radius
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)
	collision_layer = 4
	collision_mask = 2

	_sprite = Sprite.new()
	_sprite.texture = BREACH_TEXTURE
	var target_height := radius * 2.6
	var s := target_height / BREACH_TEXTURE.get_size().y
	_sprite.scale = Vector2(s, s)
	add_child(_sprite)

	_e_hint = Label.new()
	_e_hint.text = "[E]"
	_e_hint.rect_position = Vector2(-10.0, -radius - 30.0)
	_e_hint.visible = false
	add_child(_e_hint)

	GameManager.register_breach()
	update()

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body: Node) -> void:
	if body.name == "Player":
		player_in_range = false

func _process(_delta: float) -> void:
	update()
	_e_hint.visible = player_in_range and not _repaired
	var flash := 0.75 + 0.25 * sin(OS.get_ticks_msec() / 120.0)
	_sprite.modulate = Color(flash, flash * 0.55, flash * 0.55, 1.0)

func _physics_process(delta: float) -> void:
	if _repaired:
		return

	if player_in_range and Input.is_key_pressed(KEY_E):
		repair_progress += delta
		if repair_progress >= repair_time:
			_complete_repair()
	elif repair_progress > 0.0:
		repair_progress = max(0.0, repair_progress - delta * 0.5)

func _complete_repair() -> void:
	_repaired = true
	GameManager.clear_breach()
	GameManager.add_spare_part()
	AudioManager.play_ding()
	queue_free()

func _draw() -> void:
	if repair_progress > 0.0:
		var ratio := repair_progress / repair_time
		draw_arc(Vector2.ZERO, radius + 10.0, -PI / 2.0, -PI / 2.0 + 2.0 * PI * ratio, 32, Color(0.2, 1.0, 0.4), 4.0)
