extends Area2D

# A hazard spawned at random by Main.gd. Drains oxygen/hull while active.
# The player must stand inside and hold E for repair_time seconds to fix it.

export var repair_time := 3.5
export var radius := 26.0

var player_in_range := false
var repair_progress := 0.0
var _repaired := false

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

	var shape := CircleShape2D.new()
	shape.radius = radius
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)
	collision_layer = 4
	collision_mask = 2

	GameManager.register_breach()
	update()

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body: Node) -> void:
	if body.name == "Player":
		player_in_range = false

func _process(_delta: float) -> void:
	update()

func _physics_process(delta: float) -> void:
	if _repaired:
		return

	if player_in_range and Input.is_key_pressed(KEY_E):
		repair_progress += delta
		if repair_progress >= repair_time:
			_complete_repair()
	elif repair_progress > 0.0:
		repair_progress = max(0.0, repair_progress - delta * 0.5)

func _complete_repair() -> void:
	_repaired = true
	GameManager.clear_breach()
	GameManager.add_spare_part()
	AudioManager.play_ding()
	queue_free()

func _draw() -> void:
	var flash := 0.55 + 0.35 * sin(OS.get_ticks_msec() / 120.0)
	draw_circle(Vector2.ZERO, radius, Color(0.9, 0.15, 0.15, flash))
	if repair_progress > 0.0:
		var ratio := repair_progress / repair_time
		draw_arc(Vector2.ZERO, radius + 6.0, -PI / 2.0, -PI / 2.0 + 2.0 * PI * ratio, 32, Color(0.2, 1.0, 0.4), 4.0)
