extends Node2D

# Black Grid — kichik podstansiya namunasi (11.2/11.5, 29.4-bo'lim):
# uchta zanjirdan ikkitasini yoqish shahar chiroqlarini tiklaydi.

var _powered := false

onready var _circuits := [$CircuitA, $CircuitB, $CircuitC]

func _ready() -> void:
	for c in _circuits:
		c.connect("toggled", self, "_on_circuit_toggled")
	if GameState.black_grid_powered:
		_apply_powered_visual()

func _on_circuit_toggled(_activated: bool) -> void:
	if _powered:
		return
	var count := 0
	for c in _circuits:
		if c.activated:
			count += 1
	if count >= 2:
		_powered = true
		GameState.mark_black_grid_powered()
		GameState.add_resource("TECH", 2)
		_apply_powered_visual()

func _apply_powered_visual() -> void:
	VisualServer.set_default_clear_color(Color(0.1, 0.11, 0.13))
