extends Area2D

# E04 Shishgan halok bo'lganda tarqaladigan gaz (9.1-bo'lim izohi):
# 100 radius, 6 s, 5 zarar/soniya, kirishdan keyin 0,5 s kechikish bilan.

const RADIUS := 100.0
const DURATION := 6.0
const DPS := 5.0
const ENTRY_DELAY := 0.5

var _age := 0.0
var _player_in := false
var _player_enter_time := -1.0
var _player_ref: Node = null

func _ready() -> void:
	var shape := CircleShape2D.new()
	shape.radius = RADIUS
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)
	collision_layer = 0
	collision_mask = 2
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")
	update()

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		_player_in = true
		_player_enter_time = _age
		_player_ref = body

func _on_body_exited(body: Node) -> void:
	if body.name == "Player":
		_player_in = false

func _process(delta: float) -> void:
	_age += delta
	update()
	if _player_in and is_instance_valid(_player_ref) and _age - _player_enter_time >= ENTRY_DELAY:
		_player_ref.take_damage(DPS * delta)
	if _age >= DURATION:
		queue_free()

func _draw() -> void:
	var alpha: float = 0.35 * (1.0 - _age / DURATION)
	draw_circle(Vector2.ZERO, RADIUS, Color(0.4, 0.85, 0.3, alpha))
