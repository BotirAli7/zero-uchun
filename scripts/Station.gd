extends Area2D

# Fixed station the player can hold E next to: oxygen, power or food
# generator, or the "signal" array that wins the game once enough
# spare parts have been delivered.

const ICON_TEXTURES := {
	"oxygen": preload("res://assets/icon_oxygen.png"),
	"power": preload("res://assets/icon_power.png"),
	"food": preload("res://assets/icon_food.png"),
	"signal": preload("res://assets/icon_signal.png"),
}

export(String, "oxygen", "power", "food", "signal") var kind := "oxygen"
export var refill_rate := 20.0
export var radius := 40.0
export var label_text := ""

var player_in_range := false
var _e_hint: Label
var _icon_sprite: Sprite

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

	_icon_sprite = Sprite.new()
	var texture: Texture = ICON_TEXTURES[kind]
	_icon_sprite.texture = texture
	var target_height := radius * 2.3
	var s := target_height / texture.get_size().y
	_icon_sprite.scale = Vector2(s, s)
	add_child(_icon_sprite)

	if label_text != "":
		var label := Label.new()
		label.text = label_text
		label.rect_position = Vector2(-radius, radius + 4.0)
		add_child(label)

	_e_hint = Label.new()
	_e_hint.text = "[E]"
	_e_hint.rect_position = Vector2(-10.0, -radius - 26.0)
	_e_hint.visible = false
	add_child(_e_hint)

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
	_e_hint.visible = player_in_range
	if kind == "signal":
		if GameManager.spare_parts >= GameManager.REQUIRED_PARTS:
			_icon_sprite.modulate = Color(0.7, 1.4, 1.4)
		else:
			_icon_sprite.modulate = Color(0.55, 0.5, 0.65)
