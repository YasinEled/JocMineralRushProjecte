class_name OptionsMenu
extends Control

@onready var exit_button: Button = $"../canvasButton/Exit_button"


signal exit_options_menu

func ready():
	exit_button.button_down.connect(_on_exit_button_pressed)
	set_process(false)
	
	
func _on_exit_button_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)
