extends Node2D

export var size := Vector2(300, 300)
export var color := Color(0.12, 0.12, 0.16)
export var label_text := ""

func _ready() -> void:
	update()
	if label_text != "":
		var label := Label.new()
		label.text = label_text
		label.modulate = Color(1, 1, 1, 0.35)
		label.rect_position = Vector2(-size.x / 2.0 + 10.0, -size.y / 2.0 + 8.0)
		add_child(label)

func _draw() -> void:
	draw_rect(Rect2(-size / 2.0, size), color)
