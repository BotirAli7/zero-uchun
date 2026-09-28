extends CanvasLayer

const WINDOW_SIZE := Vector2(1024, 600)

export var objective_text := "Yardga kirib, yukni toping va HAVENga qaytaring."

var health_bar: ProgressBar
var stamina_bar: ProgressBar
var ammo_label: Label
var objective_label: Label
var msg_panel: Panel
var msg_label: Label

func _ready() -> void:
	add_to_group("hud")

	var root := Control.new()
	add_child(root)

	var bars_box := VBoxContainer.new()
	bars_box.rect_position = Vector2(16, 16)
	root.add_child(bars_box)

	health_bar = _make_bar(bars_box, "Sog'liq")
	stamina_bar = _make_bar(bars_box, "Chidamlilik")

	ammo_label = Label.new()
	ammo_label.rect_position = Vector2(16, 96)
	root.add_child(ammo_label)

	objective_label = Label.new()
	objective_label.text = objective_text
	objective_label.rect_position = Vector2(16, 120)
	objective_label.rect_min_size = Vector2(360, 40)
	objective_label.autowrap = true
	root.add_child(objective_label)

	var hint := Label.new()
	hint.text = "WASD yurish, Shift yugurish, sichqoncha nishon, LMB otish, R o'qlash, E olish, G qo'yish"
	hint.modulate = Color(1, 1, 1, 0.5)
	hint.rect_position = Vector2(16, WINDOW_SIZE.y - 30.0)
	root.add_child(hint)

	msg_panel = Panel.new()
	msg_panel.rect_size = Vector2(440, 160)
	msg_panel.rect_position = (WINDOW_SIZE - msg_panel.rect_size) / 2.0
	msg_panel.visible = false
	root.add_child(msg_panel)

	msg_label = Label.new()
	msg_label.rect_position = Vector2(24, 24)
	msg_label.rect_min_size = Vector2(390, 90)
	msg_label.autowrap = true
	msg_panel.add_child(msg_label)

func _make_bar(parent: Control, label_text: String) -> ProgressBar:
	var label := Label.new()
	label.text = label_text
	parent.add_child(label)

	var bar := ProgressBar.new()
	bar.rect_min_size = Vector2(220, 20)
	bar.max_value = 100.0
	bar.value = 100.0
	bar.percent_visible = false
	parent.add_child(bar)
	return bar

func _process(_delta: float) -> void:
	var players := get_tree().get_nodes_in_group("player")
	if players.size() == 0:
		return
	var p: Node = players[0]
	health_bar.value = p.health
	stamina_bar.value = p.stamina
	var reload_text := " (qayta o'qlanmoqda)" if p.reloading else ""
	if p.carrying_cargo:
		ammo_label.text = "Yuk ko'tarilgan — qurol ishlatilmaydi"
	else:
		ammo_label.text = "O'q: %d/%d%s" % [p.ammo, p.WEAPON_MAG_SIZE, reload_text]

func show_mission_complete() -> void:
	msg_panel.visible = true
	msg_label.text = "YUK TOPSHIRILDI!\n\n1-bosqich maqsadi bajarildi: yurish, nishonga olish, jang va yukni qaytarish tizimlari ishlayapti."
