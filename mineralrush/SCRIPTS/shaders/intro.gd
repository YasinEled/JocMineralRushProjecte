extends Control


@onready var video_stream_player: VideoStreamPlayer = $Map/VideoStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	video_stream_player.play()
# Conecta la señal 'finished' al método '_on_video_finished'
	video_stream_player.finished.connect(_on_video_finished)


func _on_video_finished() -> void:
	get_tree().change_scene_to_file("res://ESCENAS/OPTIONS/GLOBAL/menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
