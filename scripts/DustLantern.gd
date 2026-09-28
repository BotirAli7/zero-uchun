extends Node2D

# Dust Lantern sektori kontrolleri: to'da javobi (generator ishga
# tushganda), o'yinchi o'limida qayta yuklash.

onready var _hud := $HUD
onready var _generator := $RoomD/GeneratorSwitch

func _ready() -> void:
	_generator.connect("restored", self, "_on_generator_restored")
	var player := $Player
	player.connect("died", self, "_on_player_died")

func _on_generator_restored() -> void:
	GameState.log_event("Signal dushmanlarni jalb qildi!")
	_spawn_enemy("E01", Vector2(1050, 700))
	_spawn_enemy("E01", Vector2(1280, 680))

func _spawn_enemy(kind: String, pos: Vector2) -> void:
	var e := KinematicBody2D.new()
	e.set_script(load("res://scripts/Enemy.gd"))
	e.kind = kind
	add_child(e)
	e.global_position = pos

func _on_player_died() -> void:
	_hud.show_game_over()
	var t := Timer.new()
	t.wait_time = 2.0
	t.one_shot = true
	add_child(t)
	t.connect("timeout", self, "_reload")
	t.start()

func _reload() -> void:
	get_tree().reload_current_scene()
