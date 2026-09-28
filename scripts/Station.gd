extends Area2D

# Fixed station the player can hold E next to: oxygen, power or food
# generator, or the "signal" array that wins the game once enough
# spare parts have been delivered.

export(String, "oxygen", "power", "food", "signal") var kind := "oxygen"
export var refill_rate := 20.0
export var radius := 40.0
export var label_text := ""

var player_in_range := false

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

	if label_text != "":
		var label := Label.new()
		label.text = label_text
		label.rect_position = Vector2(-radius, radius + 4.0)
		add_child(label)

	update()

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body: Node) -> void:
	if body.name == "Player":
		player_in_range = false

func _physics_process(delta: float) -> void:
	if not (player_in_range and Input.is_key_pressed(KEY_E)):
		return
	match kind:
		"oxygen":
			GameManager.refill_oxygen(refill_rate * delta)
		"power":
			GameManager.refill_power(refill_rate * delta)
		"food":
			GameManager.refill_food(refill_rate * delta)
		"signal":
			GameManager.try_activate_signal(delta)

func _process(_delta: float) -> void:
	if kind == "signal":
		update()

func _draw() -> void:
	var fill_color: Color
	match kind:
		"oxygen":
			fill_color = Color(0.2, 0.9, 0.5)
		"power":
			fill_color = Color(0.95, 0.8, 0.2)
		"food":
			fill_color = Color(0.85, 0.55, 0.25)
		"signal":
			if GameManager.spare_parts >= GameManager.REQUIRED_PARTS:
				fill_color = Color(0.3, 0.9, 0.9)
			else:
				fill_color = Color(0.4, 0.2, 0.5)
		_:
			fill_color = Color(1, 1, 1)
	draw_circle(Vector2.ZERO, radius, fill_color)
	draw_circle(Vector2.ZERO, radius * 0.55, Color(0.05, 0.05, 0.08))
