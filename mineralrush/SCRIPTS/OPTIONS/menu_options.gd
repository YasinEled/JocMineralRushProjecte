class_name OptionsMenu
extends Control

@onready var exit_button: Button = $MarginContainer/VBoxContainer/Exit_button as Button
@onready var menu_options: OptionsMenu = $"."


signal exit_options_menu

func ready():
	exit_button.button_down.connect(_on_exit_button_pressed)
	set_process(false)
	
	
func _on_exit_button_pressed() -> void:
	menu_options.visible = false
	exit_options_menu.emit()
	set_process(false)
