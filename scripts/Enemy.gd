extends KinematicBody2D

# E01 Sudraluvchi, E02 Chopqir, E03 Qichqiruvchi (9.1-jadval).
# Holatlar: kutish, ovozni tekshirish, jang (yaqinlashish/hujum), halok
# (9.3-bo'lim ro'yxatining soddalashtirilgan 1-bosqich ko'rinishi).

export(String, "E01", "E02", "E03") var kind := "E01"

const STATS := {
	"E01": {"hp": 60.0, "speed": 105.0, "dmg": 15.0, "atk_interval": 1.5, "telegraph": 0.55, "attack_range": 45.0, "color": Color(0.55, 0.35, 0.3)},
	"E02": {"hp": 45.0, "speed": 270.0, "dmg": 12.0, "atk_interval": 1.1, "telegraph": 0.65, "attack_range": 40.0, "color": Color(0.75, 0.6, 0.2)},
	"E03": {"hp": 80.0, "speed": 90.0, "dmg": 0.0, "atk_interval": 20.0, "telegraph": 2.0, "attack_range": 160.0, "color": Color(0.5, 0.3, 0.6)},
}

const SIGHT_RANGE := 260.0
const LOSE_TRACK_TIME := 6.0

enum State { IDLE, INVESTIGATE, CHASE, TELEGRAPH, DEAD }

var state = State.IDLE
var hp := 60.0
var _stats: Dictionary
var _target: Node = null
var _investigate_point := Vector2.ZERO
var _state_timer := 0.0
var _attack_cd := 0.0
var _lose_track_timer := 0.0

func _ready() -> void:
	_stats = STATS[kind]
	hp = _stats.hp

	var shape := CircleShape2D.new()
	shape.radius = 16.0
	var collision := CollisionShape2D.new()
	collision.shape = shape
	add_child(collision)
	collision_layer = 4
	collision_mask = 1

	add_to_group("enemies")
	update()

func hear_noise(from_position: Vector2) -> void:
	if state == State.DEAD or state == State.CHASE:
		return
	state = State.INVESTIGATE
	_investigate_point = from_position
	_state_timer = 4.0
	GameState.log_event(kind + " shovqinni eshitdi.")

func take_damage(amount: float) -> void:
	if state == State.DEAD:
		return
	hp -= amount
	if hp <= 0.0:
		state = State.DEAD
		set_physics_process(false)
		GameState.log_event(kind + " yo'q qilindi.")
		var t := Timer.new()
		t.wait_time = 0.3
		t.one_shot = true
		add_child(t)
		t.connect("timeout", self, "queue_free")
		t.start()
		return

	var players := get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		_target = players[0]
		state = State.CHASE

func _physics_process(delta: float) -> void:
	if state == State.DEAD:
		return
	update()

	var players := get_tree().get_nodes_in_group("player")
	var player: Node = players[0] if players.size() > 0 else null

	match state:
		State.IDLE:
			pass
		State.INVESTIGATE:
			_state_timer -= delta
			var to_point := _investigate_point - global_position
			if to_point.length() > 8.0:
				move_and_slide(to_point.normalized() * _stats.speed * 0.6)
			if player and global_position.distance_to(player.global_position) <= SIGHT_RANGE:
				_target = player
				state = State.CHASE
			elif _state_timer <= 0.0:
				state = State.IDLE
		State.CHASE:
			if not is_instance_valid(_target):
				state = State.IDLE
				return
			if _attack_cd > 0.0:
				_attack_cd -= delta
			var to_target: Vector2 = _target.global_position - global_position
			var dist: float = to_target.length()
			if dist > SIGHT_RANGE * 1.4:
				_lose_track_timer += delta
				if _lose_track_timer > LOSE_TRACK_TIME:
					state = State.IDLE
					_lose_track_timer = 0.0
					return
			else:
				_lose_track_timer = 0.0
			if dist <= _stats.attack_range and _attack_cd <= 0.0:
				state = State.TELEGRAPH
				_state_timer = _stats.telegraph
			elif dist > _stats.attack_range:
				move_and_slide(to_target.normalized() * _stats.speed)
		State.TELEGRAPH:
			_state_timer -= delta
			if _state_timer <= 0.0:
				_resolve_attack()
				_attack_cd = _stats.atk_interval
				state = State.CHASE

func _resolve_attack() -> void:
	if not is_instance_valid(_target):
		return
	if global_position.distance_to(_target.global_position) > _stats.attack_range * 1.3:
		return
	if kind == "E03":
		NoiseManager.emit_noise(global_position, 600.0)
		GameState.log_event("E03 qichqirdi!")
	elif _target.has_method("take_damage"):
		_target.take_damage(_stats.dmg)

func _draw() -> void:
	var color: Color = _stats.color if _stats else Color(1, 1, 1)
	draw_circle(Vector2.ZERO, 16.0, color)
	if state == State.TELEGRAPH:
		draw_circle(Vector2.ZERO, 21.0, Color(1.0, 1.0, 1.0, 0.5))
	elif state == State.INVESTIGATE:
		draw_circle(Vector2.ZERO, 4.0, Color(1.0, 0.9, 0.3))
