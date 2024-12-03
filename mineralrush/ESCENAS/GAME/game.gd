extends Node2D

@onready var animation_player: AnimationPlayer = $Map/newTerreno1/AnimationPlayer
@onready var mas: Sprite2D = $Map/newTerreno1
@onready var butMas: Button = $Map/newTerreno1/butMas as Button
@onready var map: Node = $Map as Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("flotante_mas")
