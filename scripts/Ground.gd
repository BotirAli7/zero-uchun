extends Node2D

export var size := Vector2(900, 700)
export var color := Color(0.16, 0.17, 0.15)
export var label_text := ""

func _ready() -> void:
	update()
	if label_text != "":
		var label := Label.new()
		label.text = label_text
		label.modulate = Color(1, 1, 1, 0.4)
		label.rect_position = Vector2(-size.x / 2.0 + 10.0, -size.y / 2.0 + 8.0)
		add_child(label)

func _draw() -> void:
	draw_rect(Rect2(-size / 2.0, size), color)
	var grid_step := 60.0
	var line_color := Color(1, 1, 1, 0.03)
	var x := -size.x / 2.0
	while x <= size.x / 2.0:
		draw_line(Vector2(x, -size.y / 2.0), Vector2(x, size.y / 2.0), line_color, 1.0)
		x += grid_step
	var y := -size.y / 2.0
	while y <= size.y / 2.0:
		draw_line(Vector2(-size.x / 2.0, y), Vector2(size.x / 2.0, y), line_color, 1.0)
		y += grid_step
