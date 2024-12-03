extends Button
@onready var exit_button: Button = $"."

var originalScale
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	originalScale = exit_button.scale
func _on_mouse_entered() -> void:
	exit_button.scale = scale * 1.1


func _on_mouse_exited() -> void:
	exit_button.scale = originalScale
