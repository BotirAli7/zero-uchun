extends Area2D

# Sahna orasidagi o'tish (HAVEN <-> Yard-01).

export var target_scene := "res://scenes/Yard.tscn"
export var label_text := "Chiqish"

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	collision_layer = 32
	collision_mask = 2
	var shape := CircleShape2D.new()
	shape.radius = 28.0
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)

	var label := Label.new()
	label.text = label_text
	label.rect_position = Vector2(-30.0, -46.0)
	add_child(label)

	update()

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().change_scene(target_scene)

func _draw() -> void:
	draw_circle(Vector2.ZERO, 28.0, Color(0.3, 0.6, 0.9, 0.45))
