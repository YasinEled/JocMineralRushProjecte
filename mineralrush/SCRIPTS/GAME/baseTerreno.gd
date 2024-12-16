extends TileMapLayer

#func is_buildable(global_position: Vector2) -> bool:
	#var local_position = to_local(global_position)  # Convierte la posición global a local
	#var tile_position = local_to_map(local_position)  # Convierte la posición local a la cuadrícula
	#var tile_id = get_cell_source_id(Vector2i(tile_position))  # Obtén el ID del tile
	#return tile_id == 0  # Cambia "1" por el ID del tile que representa zonas construibles

func _process(delta):
	pass
	#var mouse_position = get_viewport().get_mouse_position()
	#var global_mouse_position = to_global(mouse_position)  # Obtén la posición global
	#if is_buildable(global_mouse_position):
		#print("Zona válida para construir")
	#else:
		#print("No se puede construir aquí")
