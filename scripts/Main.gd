extends Node2D

const BREACH_WAIT_MIN := 4.0
const BREACH_WAIT_STEP := 0.4
const METEOR_WAIT_MIN := 20.0
const METEOR_WAIT_MAX := 35.0

var _breach_scene := preload("res://scenes/HullBreach.tscn")
var _occupied_points := []
var _breach_wait_time := 12.0

onready var _breach_points := $BreachPoints.get_children()
onready var _hud := $HUD
onready var _spawn_timer := $BreachSpawnTimer
onready var _meteor_timer := $MeteorTimer

func _ready() -> void:
	GameManager.reset()
	GameManager.connect("game_over", self, "_on_game_over")
	GameManager.connect("victory", self, "_on_victory")
	_spawn_timer.connect("timeout", self, "_on_spawn_timer_timeout")
	_meteor_timer.connect("timeout", self, "_on_meteor_timer_timeout")
	_meteor_timer.wait_time = rand_range(METEOR_WAIT_MIN, METEOR_WAIT_MAX)
	_meteor_timer.start()
	VisualServer.set_default_clear_color(Color(0.03, 0.03, 0.06))
	_hud.show_best_sol(GameManager.best_sol)

func _spawn_one_breach() -> bool:
	var free_points := []
	for point in _breach_points:
		if not _occupied_points.has(point):
			free_points.append(point)

	if free_points.empty():
		return false

	var point: Position2D = free_points[randi() % free_points.size()]
	_occupied_points.append(point)

	var breach = _breach_scene.instance()
	add_child(breach)
	breach.global_position = point.global_position
	breach.connect("tree_exited", self, "_on_breach_removed", [point])
	return true

func _on_spawn_timer_timeout() -> void:
	# The station degrades over time: breaches start appearing more often.
	_breach_wait_time = max(BREACH_WAIT_MIN, _breach_wait_time - BREACH_WAIT_STEP)
	_spawn_timer.wait_time = _breach_wait_time

	if GameManager.is_game_over:
		return

	_spawn_one_breach()

func _on_meteor_timer_timeout() -> void:
	_meteor_timer.wait_time = rand_range(METEOR_WAIT_MIN, METEOR_WAIT_MAX)
	_meteor_timer.start()

	if GameManager.is_game_over:
		return

	_hud.show_alert("METEORIT YOMG'IRI!")
	for i in range(2):
		_spawn_one_breach()

func _on_breach_removed(point: Position2D) -> void:
	_occupied_points.erase(point)

func _on_game_over(reason: String, survival_time: float) -> void:
	_hud.show_game_over(reason, survival_time)

func _on_victory(survival_time: float) -> void:
	_hud.show_victory(survival_time)
