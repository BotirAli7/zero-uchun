extends Area2D

# Yuk qutisi: E bilan ko'tariladi. O'yinchi obyekti sahna almashganda
# yo'q qilinadigan sahna daraxtiga tegishli bo'lgani uchun, ko'tarilgan
# holat jismoniy obyekt sifatida emas, GameState.carrying_cargo orqali
# sahnalar osha saqlanadi (Player._ready() shundan o'qiydi).

export var label_text := "Yuk qutisi (E)"

var player_in_range := false
var _label: Label

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

	var shape := CircleShape2D.new()
	shape.radius = 22.0
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)
	collision_layer = 8
	collision_mask = 2

	_label = Label.new()
	_label.text = label_text
	_label.rect_position = Vector2(-40.0, -46.0)
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
	if player_in_range and Input.is_key_pressed(KEY_E):
		var players := get_tree().get_nodes_in_group("player")
		if players.size() > 0:
			_pick_up(players[0])

func _pick_up(player: Node) -> void:
	GameState.carrying_cargo = true
	player.carrying_cargo = true
	GameState.log_event("Yuk ko'tarildi.")
	queue_free()

func _draw() -> void:
	draw_rect(Rect2(Vector2(-18.0, -14.0), Vector2(36.0, 28.0)), Color(0.55, 0.42, 0.24))
	draw_rect(Rect2(Vector2(-18.0, -14.0), Vector2(36.0, 28.0)), Color(0.25, 0.18, 0.1), false, 2.0)
