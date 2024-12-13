extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var new_terreno_1: Sprite2D = $"../Map/newTerreno1"
@onready var but_mas: Button = $"../Map/newTerreno1/butMas"
@onready var but_stone_add: Button = $"../Map/StoneADD/butStoneADD"
@onready var mineral: Label = $CanvasLayer/Mineral

var esta_bajado = false
var hayTerreno = false
var comprado = false

var contadorStone = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_home_pressed() -> void:
	if (esta_bajado == false):
		animation_player.play("MasMenuSuperior")
		esta_bajado = true
	else :
		animation_player.play("MenosMenuSuperior")
		esta_bajado = false


func _on_mas_pressed() -> void:
	if (comprado == false):
		if (hayTerreno == false):
			new_terreno_1.visible = true
			hayTerreno = true
		else :
			new_terreno_1.visible = false
			hayTerreno = false
	


func _on_but_mas_pressed() -> void:
	comprado = true


func _on_but_stone_add_pressed() -> void:
	contadorStone += 1  # Sumar 1 a contadorStone
	mineral.text = str(contadorStone)  # Actualiza el texto con el valor de contadorStone
