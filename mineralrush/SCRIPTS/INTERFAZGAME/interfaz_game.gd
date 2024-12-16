extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var new_terreno_1: Sprite2D = $"../Map/newTerreno1"
@onready var but_mas: Button = $"../Map/newTerreno1/butMas"
@onready var but_stone_add: Button = $"../Map/StoneADD/butStoneADD"
@onready var mineral: Label = $CanvasLayer/Mineral
@onready var update: Button = $CanvasLayer/update
@onready var map: Node = $"../Map"
@onready var money_count: Label = $CanvasLayer/moneyCount


var esta_bajado = false
var hayTerreno = false
var comprado = false
var time_accumulator = 0.0  # Para acumular el tiempo transcurrido
var contadorStone = 0;
var contadorMonedas = 0;
var time1 = 3.0  # El tiempo objetivo inicial para incrementar el contador
var time2 = 1.0  # El tiempo objetivo inicial para incrementar el contador
var time3 = 4.0  # El tiempo objetivo inicial para incrementar el contador

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (map.nivel_1.visible == true):
		var current_time = Time.get_ticks_msec() / 1000.0
		if current_time >= time1:
			contadorMonedas += 1
			time1 += 3.0  # Actualiza el próximo objetivo a 3 segundos después del actual
			money_count.text = str(contadorMonedas)  # Actualiza el texto con el valor de contadorStone
	if (map.nivel_2.visible == true):
		var current_time2 = Time.get_ticks_msec() / 1000.0
		if current_time2 >= time2:
			contadorMonedas += 5
			time2 += 3.0  # Actualiza el próximo objetivo a 3 segundos después del actual
			money_count.text = str(contadorMonedas)  # Actualiza el texto con el valor de contadorStone
		
		if (map.nivel_2.visible == true):
			var current_time3 = Time.get_ticks_msec() / 1000.0
			if current_time3 >= time3:
				contadorMonedas += 5
				time3 += 3.0  # Actualiza el próximo objetivo a 3 segundos después del actual
				money_count.text = str(contadorMonedas)  # Actualiza el texto con el valor de contadorStone


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
	



func _on_but_stone_add_pressed() -> void:
	contadorStone += 1  # Sumar 1 a contadorStone
	mineral.text = str(contadorStone)  # Actualiza el texto con el valor de contadorStone


func _on_update_pressed() -> void:
	if(comprado == true):
		if(contadorStone > 30):
			if (map.nivel_1.visible == false):
				map.nivel_1.visible = true
				map.nivel_1_2.visible = true
				contadorStone = contadorStone - 30
			
		if (map.nivel_1.visible == true && contadorStone > 45):
			if (map.nivel_2.visible == false):
				map.nivel_2.visible = true
				map.nivel_1_3.visible = true
				contadorStone = contadorStone - 45
		if (map.nivel_2.visible == true && contadorStone > 40):
			if (map.nivel_3.visible == false):
				map.nivel_3.visible = true
				map.nivel_1_4.visible = true
				contadorStone = contadorStone - 40
		mineral.text = str(contadorStone)  # Actualiza el texto con el valor de contadorStone
