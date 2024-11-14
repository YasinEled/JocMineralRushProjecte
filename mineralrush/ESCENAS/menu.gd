extends Control


@onready var menu_options: OptionsMenu = $"Map/MENU-OPTIONS" as OptionsMenu

@onready var exit_button: Button = $Map/MarginContainer/HBoxContainer/VBoxContainer/Exit_button as Button
@onready var option_button: Button = $Map/MarginContainer/HBoxContainer/VBoxContainer/OptionButton as Button
@onready var margin_container: MarginContainer = $Map/MarginContainer as MarginContainer



var urlDiscord = "https://discord.gg/4U57ehVFQz"
var urlWeb = "http://www.mineralrush.cat/index.html"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	handle_connecting_signals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	OS.shell_open(urlDiscord);


func _on_web_button_pressed() -> void:
	OS.shell_open(urlWeb);


func _on_option_button_pressed() -> void:
	margin_container.visible = false
	menu_options.set_process(true)
	menu_options.visible = true
		

func handle_connecting_signals() -> void:
	exit_button.button_down.connect(_on_exit_button_pressed)
	menu_options.exit_options_menu.connect(on_exit_option_menu)


func _on_exit_button_pressed() -> void:
	get_tree().quit()

func on_exit_option_menu() -> void:
	menu_options.visible = false
	margin_container.visible = true 
