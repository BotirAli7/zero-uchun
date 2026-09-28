extends Node

# 1-bosqich uchun sodda holat egasi, voqealar jurnali va saqlash asosi
# (reja, 29.2-bo'lim).

const SAVE_PATH := "user://kestrel_save.save"

var cargo_delivered := false
var carrying_cargo := false
var log_entries := []

func _ready() -> void:
	_load()

func log_event(text: String) -> void:
	var stamp := OS.get_ticks_msec() / 1000.0
	log_entries.append("[%0.1fs] %s" % [stamp, text])
	print("LOG: " + text)

func mark_cargo_delivered() -> void:
	cargo_delivered = true
	log_event("Yuk HAVENga topshirildi.")
	_save()

func reset_mission() -> void:
	cargo_delivered = false
	log_entries.clear()
	_save()

func _save() -> void:
	var f := File.new()
	f.open(SAVE_PATH, File.WRITE)
	f.store_var({"cargo_delivered": cargo_delivered, "log": log_entries})
	f.close()

func _load() -> void:
	var f := File.new()
	if not f.file_exists(SAVE_PATH):
		return
	f.open(SAVE_PATH, File.READ)
	var data = f.get_var()
	f.close()
	if typeof(data) == TYPE_DICTIONARY:
		cargo_delivered = data.get("cargo_delivered", false)
		log_entries = data.get("log", [])
