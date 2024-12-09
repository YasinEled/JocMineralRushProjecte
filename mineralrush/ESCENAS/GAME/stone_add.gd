extends Sprite2D
@onready var stone_add: Sprite2D = $"."
@onready var but_stone_add: Button = $butStoneADD
@onready var mineral: Label = $CanvasLayer/Mineral

var piedras = 0

# Se ejecuta cuando la escena se carga
func _ready() -> void:
	pass
	#mineral.text += piedras

func _on_but_stone_add_pressed() -> void:
	stone_add.visible = false
	but_stone_add.visible = false
