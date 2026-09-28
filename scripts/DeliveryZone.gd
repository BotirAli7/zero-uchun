extends Area2D

# HAVENdagi topshirish nuqtasi: ko'tarib kelingan resurs yoki odamni
# aniqlaydi va GameState.deliver_carrying() orqali topshiradi.

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
	if body.name != "Player" or not GameState.is_carrying():
		return
	var carrying = GameState.carrying
	var was_primary: bool = carrying.type == "resource" and carrying.get("is_primary", false)
	GameState.deliver_carrying()
	body.carrying_cargo = false
	if was_primary:
		GameState.mark_primary_objective()
		get_tree().call_group("hud", "show_primary_complete")
	else:
		get_tree().call_group("hud", "show_delivery_toast", carrying)

func _draw() -> void:
	draw_arc(Vector2.ZERO, 60.0, 0.0, 2.0 * PI, 48, Color(0.3, 0.9, 0.5, 0.6), 3.0)
