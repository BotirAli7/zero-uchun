extends Node

# Central survival state for the whole station. Autoloaded as a singleton
# so every room/system can read and modify the same shared resource pool.

signal oxygen_changed(value)
signal power_changed(value)
signal hull_changed(value)
signal game_over(reason, survival_time)

var oxygen := 100.0
var power := 100.0
var hull := 100.0
var survival_time := 0.0
var is_game_over := false
var active_breaches := 0

const OXYGEN_DRAIN_RATE := 1.0
const POWER_DRAIN_RATE := 0.6
const NO_POWER_OXYGEN_MULT := 2.5
const BREACH_OXYGEN_DRAIN := 3.0
const BREACH_HULL_DRAIN := 1.2

func _ready() -> void:
	set_process(true)

func _process(delta: float) -> void:
	if is_game_over:
		return

	survival_time += delta

	power = clamp(power - POWER_DRAIN_RATE * delta, 0.0, 100.0)
	emit_signal("power_changed", power)

	var o2_drain := OXYGEN_DRAIN_RATE
	if power <= 0.0:
		o2_drain *= NO_POWER_OXYGEN_MULT
	o2_drain += active_breaches * BREACH_OXYGEN_DRAIN

	oxygen = clamp(oxygen - o2_drain * delta, 0.0, 100.0)
	emit_signal("oxygen_changed", oxygen)

	if active_breaches > 0:
		hull = clamp(hull - active_breaches * BREACH_HULL_DRAIN * delta, 0.0, 100.0)
		emit_signal("hull_changed", hull)

	if oxygen <= 0.0:
		trigger_game_over("Kislorod tugadi. Siz stansiya ichida halok bo'ldingiz.")
	elif hull <= 0.0:
		trigger_game_over("Korpus butunlay buzildi. Stansiya vakuumga chiqib ketdi.")

func refill_oxygen(amount: float) -> void:
	oxygen = clamp(oxygen + amount, 0.0, 100.0)
	emit_signal("oxygen_changed", oxygen)

func refill_power(amount: float) -> void:
	power = clamp(power + amount, 0.0, 100.0)
	emit_signal("power_changed", power)

func register_breach() -> void:
	active_breaches += 1

func clear_breach() -> void:
	active_breaches = max(0, active_breaches - 1)

func trigger_game_over(reason: String) -> void:
	if is_game_over:
		return
	is_game_over = true
	emit_signal("game_over", reason, survival_time)

func reset() -> void:
	oxygen = 100.0
	power = 100.0
	hull = 100.0
	survival_time = 0.0
	is_game_over = false
	active_breaches = 0
