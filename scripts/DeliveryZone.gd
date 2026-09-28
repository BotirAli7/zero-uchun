extends Area2D

# HAVENdagi topshirish nuqtasi: yukni ko'tarib kelgan o'yinchini aniqlaydi.

func _ready() -> void:
	collision_layer = 16
	collision_mask = 2
	var shape := CircleShape2D.new()
	shape.radius = 60.0
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)
	connect("body_entered", self, "_on_body_entered")
	update()

func _on_body_entered(body: Node) -> void:
	if body.name != "Player" or not GameState.carrying_cargo:
		return
	GameState.carrying_cargo = false
	body.carrying_cargo = false
	GameState.mark_cargo_delivered()
	get_tree().call_group("hud", "show_mission_complete")

func _draw() -> void:
	draw_arc(Vector2.ZERO, 60.0, 0.0, 2.0 * PI, 48, Color(0.3, 0.9, 0.5, 0.6), 3.0)
