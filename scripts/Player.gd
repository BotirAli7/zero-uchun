extends KinematicBody2D

export var speed := 220.0

# Only the drawn "eye" dot turns to face movement direction - the node
# itself never rotates, or the child Camera2D would tilt the whole view.
var _facing_angle := 0.0

func _ready() -> void:
	update()

func _physics_process(_delta: float) -> void:
	var input_vector := Vector2.ZERO
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		input_vector.y -= 1

	if input_vector != Vector2.ZERO:
		_facing_angle = input_vector.angle()

	var velocity := input_vector.normalized() * speed
	move_and_slide(velocity)
	update()

func _draw() -> void:
	draw_circle(Vector2.ZERO, 14.0, Color(0.25, 0.75, 1.0))
	var eye_offset := Vector2(8.0, 0.0).rotated(_facing_angle)
	draw_circle(eye_offset, 4.0, Color(1, 1, 1, 0.7))
