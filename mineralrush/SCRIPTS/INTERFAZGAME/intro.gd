extends Control

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer

func _ready():
	# Conecta la señal 'finished' al método '_on_video_finished'
	video_stream_player.connect("finished", Callable(self, "_on_video_finished"))

func _on_video_finished():
	# Cambia de escena al finalizar el video
	get_tree().change_scene_to_file("res://ESCENAS/OPTIONS/GLOBAL/menu.tscn")
