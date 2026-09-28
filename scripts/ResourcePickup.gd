extends Area2D

# Resurs uyasi (11.7-bo'lim): POWER/METAL/TECH. E bilan ko'tariladi,
# faqat qo'l bo'sh bo'lganda (bir vaqtda bitta yuk).

export(String, "POWER", "METAL", "TECH") var kind := "POWER"
export var amount := 1
export var is_primary := false
export var triggers_self_reputation := false

const COLORS := {"POWER": Color(0.9, 0.8, 0.2), "METAL": Color(0.6, 0.65, 0.7), "TECH": Color(0.3, 0.75, 0.9)}

var player_in_range := false
var _label: Label

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

	var shape := CircleShape2D.new()
	shape.radius = 20.0
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)
	collision_layer = 8
	collision_mask = 2

	_label = Label.new()
	_label.text = ("Asosiy rele: " if is_primary else "") + "%s x%d (E)" % [kind, amount]
	_label.rect_position = Vector2(-40.0, -42.0)
	add_child(_label)

	update()

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body: Node) -> void:
	if body.name == "Player":
		player_in_range = false

func _physics_process(_delta: float) -> void:
	_label.visible = player_in_range
	if player_in_range and Input.is_key_pressed(KEY_E) and not GameState.is_carrying():
		GameState.pick_up_resource(kind, amount, is_primary)
		if triggers_self_reputation:
			GameState.set_reputation("self")
		var players := get_tree().get_nodes_in_group("player")
		if players.size() > 0:
			players[0].carrying_cargo = true
		queue_free()

func _draw() -> void:
	var c: Color = COLORS.get(kind, Color(1, 1, 1))
	draw_rect(Rect2(Vector2(-16.0, -16.0), Vector2(32.0, 32.0)), Color(0.1, 0.1, 0.12))
	draw_rect(Rect2(Vector2(-13.0, -13.0), Vector2(26.0, 26.0)), c)
