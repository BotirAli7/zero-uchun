extends KinematicBody2D

export var speed := 220.0

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

	var velocity := input_vector.normalized() * speed
	move_and_slide(velocity)
