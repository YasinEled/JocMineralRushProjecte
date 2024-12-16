extends Node

#game
@onready var mas: Sprite2D = $newTerreno1
@onready var but_mas: Button = $newTerreno1/butMas as Button

#map
@onready var no_jugable: TileMapLayer = $noJUGABLE


func _ready() -> void:
	pass	

func _on_but_mas_pressed() -> void:
	mas.visible = false
	but_mas.visible = false # Replace with function body.
	no_jugable.visible = false
	
#@onready var tilemap: TileMapLayer = $BASE
#@export var buildable_tile_id : int = 0  # ID del tile donde se puede construir
#
#
## Función para verificar si un punto está en una zona construible
#func is_buildable(global_position: Vector2) -> bool:
	#var local_position = tilemap.to_local(global_position)  # Convierte la posición global a local en relación al TileMap
	#var tile_position = tilemap.world_to_map(local_position)  # Convierte la posición local a la cuadrícula del TileMap
	#var tile_id = tilemap.get_cellv(tile_position)  # Obtén el ID del tile usando get_cellv
	#return tile_id == buildable_tile_id  # Devuelve true si el tile es adecuado para construir
#
#func _process(delta):
	#var mouse_position = get_viewport().get_mouse_position()  # Obtiene la posición del mouse en la pantalla
	#var camera = get_viewport().get_camera_2d()  # Obtén la cámara 2D activa del viewport
	#if camera:
		#var global_mouse_position = camera.unproject_position(mouse_position)  # Convierte la posición del mouse a global
		#if is_buildable(global_mouse_position):
			#print("Zona válida para construir")
		#else:
			#print("No se puede construir aquí")
