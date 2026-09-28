extends Node

# Central survival state for the whole station. Autoloaded as a singleton
# so every room/system can read and modify the same shared resource pool.

signal oxygen_changed(value)
signal power_changed(value)
signal hull_changed(value)
signal food_changed(value)
signal parts_changed(value)
signal game_over(reason, survival_time)
signal victory(survival_time)

var oxygen := 100.0
var power := 100.0
var hull := 100.0
var food := 100.0
var spare_parts := 0
var survival_time := 0.0
var is_game_over := false
var active_breaches := 0
var signal_progress := 0.0
var best_sol := 0
var has_ever_won := false

const SAVE_PATH := "user://savegame.save"
const OXYGEN_DRAIN_RATE := 1.0
const POWER_DRAIN_RATE := 0.6
const FOOD_DRAIN_RATE := 0.35
const NO_POWER_OXYGEN_MULT := 2.5
const BREACH_OXYGEN_DRAIN := 3.0
const BREACH_HULL_DRAIN := 1.2
const REQUIRED_PARTS := 5
const SIGNAL_ACTIVATION_TIME := 4.0
const SOL_LENGTH := 60.0

func _ready() -> void:
	set_process(true)
	_load_progress()

func _load_progress() -> void:
	var f := File.new()
	if not f.file_exists(SAVE_PATH):
		return
	f.open(SAVE_PATH, File.READ)
	var data = f.get_var()
	f.close()
	if typeof(data) == TYPE_DICTIONARY:
		best_sol = data.get("best_sol", 0)
		has_ever_won = data.get("has_ever_won", false)

func _save_progress() -> void:
	var f := File.new()
	f.open(SAVE_PATH, File.WRITE)
	f.store_var({"best_sol": best_sol, "has_ever_won": has_ever_won})
	f.close()

func _record_result(won: bool) -> void:
	var changed := false
	if sol() > best_sol:
		best_sol = sol()
		changed = true
	if won and not has_ever_won:
		has_ever_won = true
		changed = true
	if changed:
		_save_progress()

func sol() -> int:
	return int(survival_time / SOL_LENGTH) + 1

func _process(delta: float) -> void:
	if is_game_over:
		return

	survival_time += delta

	power = clamp(power - POWER_DRAIN_RATE * delta, 0.0, 100.0)
	emit_signal("power_changed", power)

	food = clamp(food - FOOD_DRAIN_RATE * delta, 0.0, 100.0)
	emit_signal("food_changed", food)

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
	elif food <= 0.0:
		trigger_game_over("Oziq-ovqat tugadi. Siz ochlikdan halok bo'ldingiz.")

func refill_oxygen(amount: float) -> void:
	oxygen = clamp(oxygen + amount, 0.0, 100.0)
	emit_signal("oxygen_changed", oxygen)

func refill_power(amount: float) -> void:
	power = clamp(power + amount, 0.0, 100.0)
	emit_signal("power_changed", power)

func refill_food(amount: float) -> void:
	food = clamp(food + amount, 0.0, 100.0)
	emit_signal("food_changed", food)

func add_spare_part() -> void:
	if spare_parts >= REQUIRED_PARTS:
		return
	spare_parts += 1
	emit_signal("parts_changed", spare_parts)

func try_activate_signal(delta: float) -> void:
	if is_game_over or spare_parts < REQUIRED_PARTS:
		return
	signal_progress += delta
	if signal_progress >= SIGNAL_ACTIVATION_TIME:
		trigger_victory()

func register_breach() -> void:
	active_breaches += 1

func clear_breach() -> void:
	active_breaches = max(0, active_breaches - 1)

func trigger_game_over(reason: String) -> void:
	if is_game_over:
		return
	is_game_over = true
	_record_result(false)
	emit_signal("game_over", reason, survival_time)

func trigger_victory() -> void:
	if is_game_over:
		return
	is_game_over = true
	_record_result(true)
	emit_signal("victory", survival_time)

func reset() -> void:
	oxygen = 100.0
	power = 100.0
	hull = 100.0
	food = 100.0
	spare_parts = 0
	signal_progress = 0.0
	survival_time = 0.0
	is_game_over = false
	active_breaches = 0
