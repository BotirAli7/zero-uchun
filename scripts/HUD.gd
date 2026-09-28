extends CanvasLayer

const WINDOW_SIZE := Vector2(1024, 600)

export var objective_text := ""

var health_bar: ProgressBar
var stamina_bar: ProgressBar
var ammo_label: Label
var resources_label: Label
var carrying_label: Label
var objective_label: Label
var toast_label: Label
var msg_panel: Panel
var msg_title: Label
var msg_label: Label

var _toast_time_left := 0.0

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

	resources_label = Label.new()
	resources_label.rect_position = Vector2(16, 120)
	root.add_child(resources_label)

	carrying_label = Label.new()
	carrying_label.modulate = Color(0.6, 0.9, 1.0)
	carrying_label.rect_position = Vector2(16, 144)
	root.add_child(carrying_label)

	objective_label = Label.new()
	objective_label.text = objective_text
	objective_label.rect_position = Vector2(16, 172)
	objective_label.rect_min_size = Vector2(360, 40)
	objective_label.autowrap = true
	root.add_child(objective_label)

	var hint := Label.new()
	hint.text = "WASD yurish, Shift yugurish, sichqoncha nishon, LMB otish, 1/2 qurol, R o'qlash, E olish, G qo'yish"
	hint.modulate = Color(1, 1, 1, 0.5)
	hint.rect_position = Vector2(16, WINDOW_SIZE.y - 30.0)
	root.add_child(hint)

	toast_label = Label.new()
	toast_label.rect_position = Vector2(WINDOW_SIZE.x / 2.0 - 150.0, 40.0)
	toast_label.modulate = Color(0.7, 1.0, 0.8)
	toast_label.visible = false
	root.add_child(toast_label)

	msg_panel = Panel.new()
	msg_panel.rect_size = Vector2(460, 200)
	msg_panel.rect_position = (WINDOW_SIZE - msg_panel.rect_size) / 2.0
	msg_panel.visible = false
	root.add_child(msg_panel)

	var vbox := VBoxContainer.new()
	vbox.rect_position = Vector2(24, 20)
	msg_panel.add_child(vbox)

	msg_title = Label.new()
	vbox.add_child(msg_title)

	msg_label = Label.new()
	msg_label.rect_min_size = Vector2(400, 100)
	msg_label.autowrap = true
	vbox.add_child(msg_label)

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

func _process(delta: float) -> void:
	if _toast_time_left > 0.0:
		_toast_time_left -= delta
		if _toast_time_left <= 0.0:
			toast_label.visible = false

	var players := get_tree().get_nodes_in_group("player")
	if players.size() == 0:
		return
	var p: Node = players[0]
	health_bar.value = p.health
	stamina_bar.value = p.stamina

	var w: Dictionary = p.WEAPONS[p.current_weapon]
	var reload_text := " (qayta o'qlanmoqda)" if p.reloading else ""
	ammo_label.text = "%s: %d/%d%s" % [w.name, p.ammo[p.current_weapon], w.mag, reload_text]

	resources_label.text = "POWER %d  METAL %d  TECH %d" % [
		GameState.resources.get("POWER", 0),
		GameState.resources.get("METAL", 0),
		GameState.resources.get("TECH", 0),
	]

	if GameState.is_carrying():
		var c = GameState.carrying
		if c.type == "resource":
			carrying_label.text = "Ko'tarilgan: %s x%d" % [c.kind, c.amount]
		else:
			carrying_label.text = "Ko'tarilgan: odam"
		carrying_label.visible = true
	else:
		carrying_label.visible = false

func show_delivery_toast(carrying) -> void:
	if carrying == null:
		return
	if carrying.type == "resource":
		toast_label.text = "%s x%d omborga topshirildi" % [carrying.kind, carrying.amount]
	else:
		toast_label.text = "Odam HAVENga yetkazildi"
	toast_label.visible = true
	_toast_time_left = 2.5

func show_primary_complete() -> void:
	msg_panel.visible = true
	msg_title.text = "ASOSIY MAQSAD BAJARILDI"
	msg_label.text = "Rele topshirildi. Endi generatorni ishga tushirish yoki qo'shimcha resurs/odamlarni qutqarishni davom ettirishingiz mumkin."
	var t := Timer.new()
	t.wait_time = 3.5
	t.one_shot = true
	add_child(t)
	t.connect("timeout", self, "_hide_msg_panel")
	t.start()

func _hide_msg_panel() -> void:
	msg_panel.visible = false

func show_game_over() -> void:
	msg_panel.visible = true
	msg_title.text = "SIZ YIQILDINGIZ"
	msg_label.text = "Sog'liq tugadi. Sahna qayta yuklanmoqda..."
