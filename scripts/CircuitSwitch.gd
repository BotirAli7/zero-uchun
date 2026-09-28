extends Area2D

# Black Grid: uchta elektr zanjiridan biri (11.2/11.5-bo'lim). E bilan
# yoqiladi/o'chiriladi (bosish, ushlab turish emas).

signal toggled(activated)

export var circuit_id := "A"

var player_in_range := false
var activated := false
var _label: Label
var _e_was_down := false

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

	var shape := CircleShape2D.new()
	shape.radius = 24.0
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)
	collision_layer = 8
	collision_mask = 2

	_label = Label.new()
	_label.text = "Zanjir %s (E)" % circuit_id
	_label.rect_position = Vector2(-45.0, -42.0)
	_label.visible = false
	add_child(_label)

	update()

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body: Node) -> void:
	if body.name == "Player":
		player_in_range = false

func _physics_process(_delta: float) -> void:
	_label.visible = player_in_range
	var e_down := Input.is_key_pressed(KEY_E)
	var just_pressed := e_down and not _e_was_down
	_e_was_down = e_down
	if player_in_range and just_pressed:
		activated = not activated
		emit_signal("toggled", activated)
		update()

func _draw() -> void:
	var c: Color = Color(0.3, 0.9, 0.5) if activated else Color(0.5, 0.15, 0.15)
	draw_circle(Vector2.ZERO, 20.0, c)
	draw_arc(Vector2.ZERO, 24.0, 0.0, 2.0 * PI, 24, Color(0.1, 0.1, 0.12), 3.0)
