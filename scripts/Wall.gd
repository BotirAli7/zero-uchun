extends StaticBody2D

export var size := Vector2(64, 64)
export var color := Color(0.3, 0.3, 0.36)

func _ready() -> void:
	var shape := RectangleShape2D.new()
	shape.extents = size / 2.0
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)
	collision_layer = 1
	update()

func _draw() -> void:
	draw_rect(Rect2(-size / 2.0, size), color)
