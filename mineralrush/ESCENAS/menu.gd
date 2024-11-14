extends Control
var urlDiscord = "https://discord.gg/4U57ehVFQz"
var urlWeb = "http://www.mineralrush.cat/index.html"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	OS.shell_open(urlDiscord);


func _on_web_button_pressed() -> void:
	OS.shell_open(urlWeb);
