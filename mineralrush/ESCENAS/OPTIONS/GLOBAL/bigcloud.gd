extends Sprite2D
var speed: float = 50
var screen_height: float = 0
var funciona = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_height = get_viewport_rect().size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if funciona == 1:
		position.x += speed * delta
		if position.x > 1400:
			position.x = -100
			position.y = randf() * screen_height

func _on_start_game_button_pressed() -> void:
	funciona = 1
