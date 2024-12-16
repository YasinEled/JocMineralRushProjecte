extends TileMapLayer

#
#@onready var build_area: CollisionPolygon2D = $"../Map/Area2D/CollisionPolygon2D"
#
#
#
## Función para verificar si un punto está dentro de un polígono utilizando el algoritmo de ray-casting
#func is_point_in_polygon(point: Vector2, polygon: Array) -> bool:
	#var c = false
	#var n = polygon.size()
	#for i in range(n):
		#var j = (i + 1) % n
		#if ((polygon[i].y > point.y) != (polygon[j].y > point.y)) and (point.x < (polygon[j].x - polygon[i].x) * (point.y - polygon[i].y) / (polygon[j].y - polygon[i].y) + polygon[i].x):
			#c = !c
	#return c
#
#func is_buildable(global_position: Vector2) -> bool:
	#if not build_area:
		#print("Error: 'build_area' no está asignado.")
		#return false
	#
	## Convierte la posición global a la posición local en relación al CollisionPolygon2D
	#var local_position = build_area.to_local(global_position)
	#
	## Verifica si el punto está dentro del polígono utilizando ray-casting
	#if not is_point_in_polygon(local_position, build_area.polygon):
		#print("Fuera del área válida.")
		#return false  # Fuera del área válida
	#
	#print("Dentro del área válida.")
	## Verifica el tile en el TileMap
	#var tile_position = local_to_map(to_local(global_position))
	#var tile_id = get_cell_source_id(Vector2i(tile_position))
	#return tile_id == 1  # Cambia "1" por el ID válido para construcción
	#
#
#func _process(delta):
	#var mouse_position = get_viewport().get_mouse_position()
	#var global_mouse_position = to_global(mouse_position)
	#if is_buildable(global_mouse_position):
		#print("Zona válida para construir")
	#else:
		#print("No se puede construir aquí")
