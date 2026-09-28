extends Node2D

var _breach_scene := preload("res://scenes/HullBreach.tscn")
var _occupied_points := []

onready var _breach_points := $BreachPoints.get_children()
onready var _hud := $HUD
onready var _spawn_timer := $BreachSpawnTimer

func _ready() -> void:
	GameManager.reset()
	GameManager.connect("game_over", self, "_on_game_over")
	_spawn_timer.connect("timeout", self, "_on_spawn_timer_timeout")
	VisualServer.set_default_clear_color(Color(0.03, 0.03, 0.06))

func _on_spawn_timer_timeout() -> void:
	if GameManager.is_game_over:
		return

	var free_points := []
	for point in _breach_points:
		if not _occupied_points.has(point):
			free_points.append(point)

	if free_points.empty():
		return

	var point: Position2D = free_points[randi() % free_points.size()]
	_occupied_points.append(point)

	var breach = _breach_scene.instance()
	add_child(breach)
	breach.global_position = point.global_position
	breach.connect("tree_exited", self, "_on_breach_removed", [point])

func _on_breach_removed(point: Position2D) -> void:
	_occupied_points.erase(point)

func _on_game_over(reason: String, survival_time: float) -> void:
	_hud.show_game_over(reason, survival_time)
