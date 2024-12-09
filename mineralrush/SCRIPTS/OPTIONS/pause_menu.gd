extends Control


@onready var menu_options: OptionsMenu = $"../MENU-OPTIONS"
@onready var pause_menu: Control = $"."

@onready  var main = $"../../../"
# Called when the node enters the scene tree for the first time.

var paused = false

signal exit_options_menu

func _ready() -> void:
	pass 


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		paused = !paused  # Alternar el estado de pausa
		pause_menu.visible = paused  # Mostrar u ocultar el menú


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	pause_menu.visible = false


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://ESCENAS/OPTIONS/GLOBAL/menu.tscn")


func _on_options_pressed() -> void:
	menu_options.visible = true
	pause_menu.visible = false
	
	

func _on_menuoptions_exit_options_menu() -> void:
	menu_options.visible = false
	pause_menu.visible = true
