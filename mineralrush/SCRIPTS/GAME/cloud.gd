extends Sprite2D
var speed: float = 50
var screen_height: float = 0
@onready var pause_menu: Control = $"../../Camera2D/CanvasLayer2/PauseMenu"
@onready var menu_options: OptionsMenu = $"../../Camera2D/CanvasLayer2/MENU-OPTIONS"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_height = get_viewport_rect().size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	position.x += speed * delta
	if position.x > 1400:
		position.x = -100
		position.y = randf() * screen_height
