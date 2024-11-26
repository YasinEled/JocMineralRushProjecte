extends Control
@onready var menu_options: OptionsMenu = $"../../CanvasLayer/MENU-OPTIONS"
@onready var pause_menu: Control = $"."

@onready  var main = $"../../../"

var paused = false

signal exit_options_menu
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 



func  _input(event: InputEvent) -> void:
	if  Input.is_action_just_pressed("pause"):
		pause_menu.visible = true
		paused = true
	
	
		
		


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
