extends Area2D

# Qutqariladigan mutaxassis (17-bo'lim). E bilan "ko'tariladi" (kuzatib
# olib ketiladi), HAVENga yetkazilganda GameState.aziz_rescued=true bo'ladi.

export var person_id := "aziz"
export var display_name := "Aziz (elektr ustasi)"

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
	_label.text = display_name + " (E)"
	_label.rect_position = Vector2(-60.0, -42.0)
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
		GameState.pick_up_person(person_id)
		var players := get_tree().get_nodes_in_group("player")
		if players.size() > 0:
			players[0].carrying_cargo = true
		queue_free()

func _draw() -> void:
	draw_circle(Vector2.ZERO, 15.0, Color(0.35, 0.22, 0.12))
	draw_circle(Vector2.ZERO, 12.0, Color(0.9, 0.65, 0.35))
