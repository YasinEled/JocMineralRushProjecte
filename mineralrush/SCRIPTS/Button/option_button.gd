extends Button
@onready var option_button: Button = $"."

var originalScale
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	originalScale = option_button.scale
func _on_mouse_entered() -> void:
	option_button.scale = scale * 1.1


func _on_mouse_exited() -> void:
	option_button.scale = originalScale
