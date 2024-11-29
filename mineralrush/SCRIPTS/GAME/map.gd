extends Node

@onready var no_jugable: TileMapLayer = $noJUGABLE

func _ready() -> void:
	# Buscar al nodo emisor (suponiendo que se llama "Game")
	var emisor = get_node("Game")  # Ruta relativa si Game está directamente bajo Main
	if emisor:
		emisor.connect("ocultar_noJugable", Callable(self, "_on_hide_tilemap"))
		print("Conexión establecida con el emisor.")
	else:
		print("Error: No se encontró el nodo emisor.")

func _on_hide_tilemap() -> void:
	if no_jugable:
		no_jugable.visible = false
		print("no_jugable ocultado.")
	else:
		print("Error: no_jugable no está asignado o es null.")
