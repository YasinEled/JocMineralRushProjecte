extends CanvasLayer

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Conecta la señal 'finished' al método '_on_video_finished'
	video_stream_player.finished.connect(_on_video_finished)

# Método llamado cuando el video termina
func _on_video_finished() -> void:
	video_stream_player.visible = false
	audio_stream_player_2d.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
