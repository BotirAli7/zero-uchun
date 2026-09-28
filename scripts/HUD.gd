extends CanvasLayer

const WINDOW_SIZE := Vector2(1024, 600)

var oxygen_bar: ProgressBar
var power_bar: ProgressBar
var hull_bar: ProgressBar
var food_bar: ProgressBar
var sol_label: Label
var parts_label: Label
var warning_overlay: ColorRect
var warning_label: Label

var end_panel: Panel
var end_title_label: Label
var reason_label: Label
var survived_label: Label
var restart_button: Button

var _was_critical := false

func _ready() -> void:
	var root := Control.new()
	add_child(root)

	var bars_box := VBoxContainer.new()
	bars_box.rect_position = Vector2(16, 16)
	root.add_child(bars_box)

	oxygen_bar = _make_bar(bars_box, "Kislorod")
	power_bar = _make_bar(bars_box, "Quvvat")
	hull_bar = _make_bar(bars_box, "Korpus")
	food_bar = _make_bar(bars_box, "Oziq-ovqat")

	sol_label = Label.new()
	sol_label.rect_position = Vector2(16, 192)
	root.add_child(sol_label)

	parts_label = Label.new()
	parts_label.rect_position = Vector2(16, 216)
	root.add_child(parts_label)

	warning_overlay = ColorRect.new()
	warning_overlay.rect_size = WINDOW_SIZE
	warning_overlay.color = Color(0.8, 0.1, 0.1, 0.0)
	warning_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(warning_overlay)

	warning_label = Label.new()
	warning_label.text = "OGOHLANTIRISH!"
	warning_label.rect_position = Vector2(WINDOW_SIZE.x / 2.0 - 70.0, 16)
	warning_label.visible = false
	root.add_child(warning_label)

	end_panel = Panel.new()
	end_panel.rect_size = Vector2(440, 250)
	end_panel.rect_position = (WINDOW_SIZE - end_panel.rect_size) / 2.0
	end_panel.visible = false
	root.add_child(end_panel)

	var vbox := VBoxContainer.new()
	vbox.rect_position = Vector2(24, 20)
	end_panel.add_child(vbox)

	end_title_label = Label.new()
	vbox.add_child(end_title_label)

	reason_label = Label.new()
	reason_label.autowrap = true
	reason_label.rect_min_size = Vector2(390, 40)
	vbox.add_child(reason_label)

	survived_label = Label.new()
	vbox.add_child(survived_label)

	var spacer := Control.new()
	spacer.rect_min_size = Vector2(0, 10)
	vbox.add_child(spacer)

	restart_button = Button.new()
	restart_button.text = "Qayta boshlash"
	restart_button.connect("pressed", self, "_on_restart_pressed")
	vbox.add_child(restart_button)

	GameManager.connect("oxygen_changed", self, "_on_oxygen_changed")
	GameManager.connect("power_changed", self, "_on_power_changed")
	GameManager.connect("hull_changed", self, "_on_hull_changed")
	GameManager.connect("food_changed", self, "_on_food_changed")
	GameManager.connect("parts_changed", self, "_on_parts_changed")

	_on_oxygen_changed(GameManager.oxygen)
	_on_power_changed(GameManager.power)
	_on_hull_changed(GameManager.hull)
	_on_food_changed(GameManager.food)
	_on_parts_changed(GameManager.spare_parts)

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
	if GameManager.is_game_over:
		return

	sol_label.text = "SOL %d" % GameManager.sol()

	var critical := GameManager.oxygen < 25.0 or GameManager.hull < 25.0 or GameManager.food < 15.0
	if critical:
		var pulse := 0.15 + 0.15 * sin(OS.get_ticks_msec() / 150.0)
		warning_overlay.color.a = pulse
		warning_label.visible = int(OS.get_ticks_msec() / 300) % 2 == 0
		if not _was_critical:
			AudioManager.play_warning()
	else:
		warning_overlay.color.a = 0.0
		warning_label.visible = false
	_was_critical = critical

func _on_oxygen_changed(value: float) -> void:
	oxygen_bar.value = value

func _on_power_changed(value: float) -> void:
	power_bar.value = value

func _on_hull_changed(value: float) -> void:
	hull_bar.value = value

func _on_food_changed(value: float) -> void:
	food_bar.value = value

func _on_parts_changed(value: int) -> void:
	parts_label.text = "Ehtiyot qismlar: %d/%d" % [value, GameManager.REQUIRED_PARTS]

func show_game_over(reason: String, survival_time: float) -> void:
	end_panel.visible = true
	end_title_label.text = "STANSIYA HALOKATI"
	reason_label.text = reason
	survived_label.text = "Siz SOL %d kunigacha (%d soniya) omon qoldingiz." % [GameManager.sol(), int(survival_time)]

func show_victory(survival_time: float) -> void:
	end_panel.visible = true
	end_title_label.text = "SIGNAL YUBORILDI!"
	reason_label.text = "Siz signal massivini faollashtirdingiz. Yordam yo'lda..."
	survived_label.text = "SOL %d kunida qutqarildingiz (%d soniya)." % [GameManager.sol(), int(survival_time)]

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
