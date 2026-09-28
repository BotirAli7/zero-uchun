extends Node

# Holat egasi, voqealar jurnali va saqlash (29.2, keyin 3-bosqich uchun
# kengaytirilgan: uch resurs, obro', qutqarilgan mutaxassis).

const SAVE_PATH := "user://kestrel_save.save"

var resources := {"POWER": 0, "METAL": 0, "TECH": 0}
var carrying = null  # null yoki {"type":"resource","kind":..,"amount":..} / {"type":"person","id":..}

var primary_objective_delivered := false
var generator_restored := false
var aziz_rescued := false
var black_grid_powered := false
var dust_lantern_reputation := "neutral"  # "neutral" | "residents" | "self"

var log_entries := []

func _ready() -> void:
	_load()

func log_event(text: String) -> void:
	var stamp := OS.get_ticks_msec() / 1000.0
	log_entries.append("[%0.1fs] %s" % [stamp, text])
	print("LOG: " + text)

func is_carrying() -> bool:
	return carrying != null

func pick_up_resource(kind: String, amount: int, is_primary: bool = false) -> void:
	carrying = {"type": "resource", "kind": kind, "amount": amount, "is_primary": is_primary}
	log_event("%s topildi (%d)." % [kind, amount])

func pick_up_person(person_id: String) -> void:
	carrying = {"type": "person", "id": person_id}
	log_event(person_id + " ko'tarildi.")

func drop_carrying() -> void:
	carrying = null

func deliver_carrying() -> void:
	if carrying == null:
		return
	if carrying.type == "resource":
		add_resource(carrying.kind, carrying.amount)
		log_event("%s HAVEN omboriga topshirildi (%d)." % [carrying.kind, carrying.amount])
	elif carrying.type == "person":
		if carrying.id == "aziz":
			aziz_rescued = true
			log_event("Aziz HAVENga yetkazildi.")
			if dust_lantern_reputation == "neutral":
				set_reputation("residents")
	carrying = null
	_save()

func add_resource(kind: String, amount: int) -> void:
	resources[kind] = resources.get(kind, 0) + amount

func mark_primary_objective() -> void:
	primary_objective_delivered = true
	log_event("Asosiy rele topshirildi.")
	_save()

func mark_black_grid_powered() -> void:
	black_grid_powered = true
	log_event("Black Grid: shahar chiroqlari yoqildi!")
	_save()

func mark_generator_restored() -> void:
	generator_restored = true
	log_event("Generator ishga tushirildi — elektr tiklandi.")
	_save()

func set_reputation(value: String) -> void:
	dust_lantern_reputation = value
	log_event("Dust Lantern obro'si: " + value)
	_save()

func reset_mission() -> void:
	resources = {"POWER": 0, "METAL": 0, "TECH": 0}
	carrying = null
	primary_objective_delivered = false
	generator_restored = false
	aziz_rescued = false
	black_grid_powered = false
	dust_lantern_reputation = "neutral"
	log_entries.clear()
	_save()

func _save() -> void:
	var f := File.new()
	f.open(SAVE_PATH, File.WRITE)
	f.store_var({
		"resources": resources,
		"primary_objective_delivered": primary_objective_delivered,
		"generator_restored": generator_restored,
		"aziz_rescued": aziz_rescued,
		"black_grid_powered": black_grid_powered,
		"dust_lantern_reputation": dust_lantern_reputation,
		"log": log_entries,
	})
	f.close()

func _load() -> void:
	var f := File.new()
	if not f.file_exists(SAVE_PATH):
		return
	f.open(SAVE_PATH, File.READ)
	var data = f.get_var()
	f.close()
	if typeof(data) != TYPE_DICTIONARY:
		return
	resources = data.get("resources", {"POWER": 0, "METAL": 0, "TECH": 0})
	primary_objective_delivered = data.get("primary_objective_delivered", false)
	generator_restored = data.get("generator_restored", false)
	aziz_rescued = data.get("aziz_rescued", false)
	black_grid_powered = data.get("black_grid_powered", false)
	dust_lantern_reputation = data.get("dust_lantern_reputation", "neutral")
	log_entries = data.get("log", [])
