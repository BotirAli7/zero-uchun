extends Node2D

export var size := Vector2(300, 300)
export var color := Color(0.5, 0.5, 0.55)
export var label_text := ""

var _texture := preload("res://assets/floor.png")

func _ready() -> void:
	update()
	if label_text != "":
		var label := Label.new()
		label.text = label_text
		label.modulate = Color(1, 1, 1, 0.45)
		label.rect_position = Vector2(-size.x / 2.0 + 10.0, -size.y / 2.0 + 8.0)
		add_child(label)

func _draw() -> void:
	draw_texture_rect(_texture, Rect2(-size / 2.0, size), false, color)
