extends Area2D

# "Elektrni tiklash" vazifasi (12.2-bo'lim): E tugmasini ushlab turib
# generatorni ishga tushirish. Muvaffaqiyatli bo'lsa "restored" signali
# beriladi — sahna kontrolleri shovqin/to'da javobini shu yerdan tetiklaydi
# ("chiroq bilan birga himoya tizimlari ham faollashadi", 13.8-bo'lim).

signal restored

const HOLD_REQUIRED := 3.0

var player_in_range := false
var _hold_time := 0.0
var _done := false
var _label: Label

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

	var shape := CircleShape2D.new()
	shape.radius = 30.0
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)
	collision_layer = 8
	collision_mask = 2

	_label = Label.new()
	_label.text = "Generator (E, ushlab turing)"
	_label.rect_position = Vector2(-75.0, -50.0)
	_label.visible = false
	add_child(_label)

	_done = GameState.generator_restored
	update()

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body: Node) -> void:
	if body.name == "Player":
		player_in_range = false

func _physics_process(delta: float) -> void:
	if _done:
		return
	_label.visible = player_in_range
	if player_in_range and Input.is_key_pressed(KEY_E):
		_hold_time += delta
		if _hold_time >= HOLD_REQUIRED:
			_done = true
			_label.visible = false
			GameState.mark_generator_restored()
			emit_signal("restored")
	else:
		_hold_time = max(0.0, _hold_time - delta * 0.5)
	update()

func _draw() -> void:
	var c: Color = Color(0.3, 0.9, 0.4) if _done else Color(0.6, 0.6, 0.22)
	draw_circle(Vector2.ZERO, 26.0, c)
	if _hold_time > 0.0 and not _done:
		var ratio: float = _hold_time / HOLD_REQUIRED
		draw_arc(Vector2.ZERO, 32.0, -PI / 2.0, -PI / 2.0 + 2.0 * PI * ratio, 24, Color(1, 1, 1, 0.8), 4.0)
