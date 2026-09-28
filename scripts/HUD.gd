extends CanvasLayer

const WINDOW_SIZE := Vector2(1024, 600)

var oxygen_bar: ProgressBar
var power_bar: ProgressBar
var hull_bar: ProgressBar
var timer_label: Label
var game_over_panel: Panel
var reason_label: Label
var survived_label: Label

func _ready() -> void:
	var root := Control.new()
	add_child(root)

	var bars_box := VBoxContainer.new()
	bars_box.rect_position = Vector2(16, 16)
	root.add_child(bars_box)

	oxygen_bar = _make_bar(bars_box, "Kislorod")
	power_bar = _make_bar(bars_box, "Quvvat")
	hull_bar = _make_bar(bars_box, "Korpus")

	timer_label = Label.new()
	timer_label.rect_position = Vector2(16, 132)
	root.add_child(timer_label)

	game_over_panel = Panel.new()
	game_over_panel.rect_size = Vector2(420, 230)
	game_over_panel.rect_position = (WINDOW_SIZE - game_over_panel.rect_size) / 2.0
	game_over_panel.visible = false
	root.add_child(game_over_panel)

	var vbox := VBoxContainer.new()
	vbox.rect_position = Vector2(24, 20)
	game_over_panel.add_child(vbox)

	var title := Label.new()
	title.text = "STANSIYA HALOKATI"
	vbox.add_child(title)

	reason_label = Label.new()
	reason_label.autowrap = true
	reason_label.rect_min_size = Vector2(370, 40)
	vbox.add_child(reason_label)

	survived_label = Label.new()
	vbox.add_child(survived_label)

	var spacer := Control.new()
	spacer.rect_min_size = Vector2(0, 10)
	vbox.add_child(spacer)

	var restart_button := Button.new()
	restart_button.text = "Qayta boshlash"
	restart_button.connect("pressed", self, "_on_restart_pressed")
	vbox.add_child(restart_button)

	GameManager.connect("oxygen_changed", self, "_on_oxygen_changed")
	GameManager.connect("power_changed", self, "_on_power_changed")
	GameManager.connect("hull_changed", self, "_on_hull_changed")

	_on_oxygen_changed(GameManager.oxygen)
	_on_power_changed(GameManager.power)
	_on_hull_changed(GameManager.hull)

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
	if not GameManager.is_game_over:
		timer_label.text = "Omon qolingan vaqt: %d s" % int(GameManager.survival_time)

func _on_oxygen_changed(value: float) -> void:
	oxygen_bar.value = value

func _on_power_changed(value: float) -> void:
	power_bar.value = value

func _on_hull_changed(value: float) -> void:
	hull_bar.value = value

func show_game_over(reason: String, survival_time: float) -> void:
	game_over_panel.visible = true
	reason_label.text = reason
	survived_label.text = "Siz %d soniya omon qoldingiz." % int(survival_time)

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
