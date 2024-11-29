extends Node2D

@onready var animation_player: AnimationPlayer = $Map/Mas/AnimationPlayer
@onready var mas: Sprite2D = $Map/Mas
@onready var button: Button = $Map/Mas/Button as Button
@onready var no_jugable: TileMapLayer = $noJUGABLE

signal ocultar_noJugable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("flotante_mas")
	button.connect("pressed", Callable(self, "_on_button_pressed"))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	mas.visible = false
	button.visible = false
	emit_signal("ocultar_noJugable")  # Emitir la señal
	print("Señal emitida: ocultar_noJugable")
