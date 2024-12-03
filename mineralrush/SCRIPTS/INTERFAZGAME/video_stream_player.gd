extends VideoStreamPlayer


func _ready():
	# Iniciar la reproducción automáticamente
	video_player.play()

func pause_video():
	video_player.pause()

func stop_video():
	video_player.stop()
