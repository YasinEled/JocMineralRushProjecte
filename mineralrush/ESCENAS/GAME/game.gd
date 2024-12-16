extends Node2D

@onready var animation_player: AnimationPlayer = $Map/newTerreno1/AnimationPlayer
@onready var mas: Sprite2D = $Map/newTerreno1
@onready var butMas: Button = $Map/newTerreno1/butMas as Button
@onready var map: Node = $Map as Node
@onready var tilemap_layer: TileMapLayer = $TileMapConstruccion

# Referencia al índice del tile que representa el edificio (puedes configurar esto en el inspector)
@export var building_tile_id: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("flotante_mas")
	if tilemap_layer == null:
		print("TileMapLayer no asignado!")
		return
	# Verificar si el TileSet tiene tiles válidos
	if tilemap_layer.tile_set.get_tile_count() == 0:
		print("El TileMapLayer no tiene tiles asignados.")
	else:
		print("TileSet asignado correctamente.")

func _process(delta):
	if Input.is_action_just_pressed("mouse_click"):
		var mouse_pos = get_global_mouse_position()
		print("Posición del ratón (global): ", mouse_pos)
		
		# Ajustar la posición global del ratón por el desplazamiento del TileMapLayer
		var local_pos = mouse_pos - tilemap_layer.position
		print("Posición local ajustada para TileMapLayer: ", local_pos)
		
		# Convertir la posición ajustada a coordenadas de la celda en el TileMapLayer
		var tile_pos = tilemap_layer.local_to_map(local_pos)
		print("Posición en el TileMap (celda): ", tile_pos)
		
		# Verificar si las coordenadas están dentro de los límites
		if tilemap_layer.get_used_rect().has_point(tile_pos):
			print("La posición está dentro de los límites del TileMapLayer.")
			
			# Colocar un tile de prueba para verificar que todo funciona
			tilemap_layer.set_cell(tile_pos, building_tile_id)
			print("Edificio colocado en la celda: ", tile_pos)
		else:
			print("Posición fuera de los límites del TileMapLayer")
