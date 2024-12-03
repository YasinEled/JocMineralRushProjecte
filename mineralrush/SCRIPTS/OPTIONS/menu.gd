extends Control

var speed: float = 50
var screen_height: float = 0

@onready var animacion_nuve: AnimationPlayer = $Map/BigCloudLeft/animacionNuve
@onready var menu_options: OptionsMenu = $"CanvasLayer/MENU-OPTIONS" as OptionsMenu
@onready var exit_button: Button = $CanvasLayer/canvasButton/Exit_button as Button
@onready var option_button: Button = $CanvasLayer/canvasButton/OptionButton as Button
@onready var canvas_button: CanvasLayer = $CanvasLayer/canvasButton as CanvasLayer





var urlDiscord = "https://discord.gg/4U57ehVFQz"
var urlWeb = "http://www.mineralrush.cat/index.html"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	handle_connecting_signals()



func _on_button_pressed() -> void:
	OS.shell_open(urlDiscord);


func _on_web_button_pressed() -> void:
	OS.shell_open(urlWeb);


func _on_option_button_pressed() -> void:
	canvas_button.visible = false
	menu_options.set_process(true)
	menu_options.visible = true
		

func handle_connecting_signals() -> void:
	exit_button.button_down.connect(_on_exit_button_pressed)
	menu_options.exit_options_menu.connect(on_exit_option_menu)


func _on_exit_button_pressed() -> void:
	get_tree().quit()

func on_exit_option_menu() -> void:
	menu_options.visible = false
	canvas_button.visible = true 


func _on_start_game_button_pressed() -> void:
	animacion_nuve.play("nuves") #Yasin no sabe escribir nube
	await animacion_nuve.animation_finished
	get_tree().change_scene_to_file("res://ESCENAS/GAME/game.tscn")
