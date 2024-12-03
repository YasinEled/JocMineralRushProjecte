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
