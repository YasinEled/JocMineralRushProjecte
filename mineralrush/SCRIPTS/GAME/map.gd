extends Node

#game
@onready var mas: Sprite2D = $newTerreno1
@onready var but_mas: Button = $newTerreno1/butMas as Button
@onready var stone_add: Sprite2D = $StoneADD
@onready var animation_player: AnimationPlayer = $newTerreno1/AnimationPlayer
@onready var interfaz_game: Control = $"../InterfazGame"

#map
@onready var no_jugable: TileMapLayer = $noJUGABLE


func _ready() -> void:
	pass 
func _on_but_mas_pressed() -> void:
	if (interfaz_game.contadorStone > 49):
		mas.visible = false
		but_mas.visible = false
		no_jugable.visible = false
		interfaz_game.contadorStone = interfaz_game.contadorStone - 50;
		interfaz_game.mineral.text = str(interfaz_game.contadorStone)  # Actualiza el texto con el valor de contadorStone
		interfaz_game.comprado = true
	else:
		# Reproduce la animación "error"
		animation_player.play("error")
		
		# Esperar hasta que la animación termine
		await get_tree().create_timer(animation_player.current_animation_length).timeout
		
		# Luego reproduce la animación "flotante_mas"
		animation_player.play("flotante_mas")
