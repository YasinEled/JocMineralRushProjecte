extends Camera2D
@onready var pause_menu: Control = $CanvasLayer2/PauseMenu
@onready var menu_options: OptionsMenu = $"CanvasLayer2/MENU-OPTIONS"


# Velocidad de movimiento de la cámara
@export var speed: float = 200.0

# Sensibilidad del movimiento del ratón
@export var mouse_sensitivity: float = 0.5

# Límites opcionales para el movimiento de la cámara (valor por defecto)
@export var limit_x_min: float = 500
@export var limit_x_max: float = 900
@export var limit_y_min: float = 250
@export var limit_y_max: float = 550

# Variables para el zoom
@export var zoom_levels: Array = [
	{ "zoom": 0.8, "limits": { "x_min": 630, "x_max": 750, "y_min": 340, "y_max": 470 } },
	{ "zoom": 1.0, "limits": { "x_min": 630, "x_max": 750, "y_min": 340, "y_max": 470 } },
	{ "zoom": 1.2, "limits": { "x_min": 390, "x_max": 1000, "y_min": 200, "y_max": 600 } },
	{ "zoom": 1.5, "limits": { "x_min": 390, "x_max": 1000, "y_min": 200, "y_max": 600 } },
	{ "zoom": 2.0, "limits": { "x_min": 200, "x_max": 1170, "y_min": 95, "y_max": 700 } }
]

# Variable para almacenar el nivel de zoom actual
var current_zoom_index: int = 2  # El índice del nivel de zoom actual (por defecto, 1.0)

# Variables para el arrastre del ratón
var dragging: bool = false
var last_mouse_position: Vector2 = Vector2.ZERO

# Variable para hacer el cambio de zoom suave
var target_zoom: float = zoom_levels[current_zoom_index]["zoom"]
var zoom_speed: float = 5.0  # Velocidad de la interpolación

func _ready() -> void:
	if (pause_menu.visible == false && menu_options.visible == false):
		# Inicializa la posición de la cámara cuando el juego empieza
		last_mouse_position = get_global_mouse_position()
		# Ajusta el zoom inicial y los límites
		apply_zoom_level(current_zoom_index)

func _process(delta: float) -> void:
	if (pause_menu.visible == false && menu_options.visible == false):
		# Interpolación suave del zoom
		zoom.x = lerp(zoom.x, target_zoom, zoom_speed * delta)
		zoom.y = lerp(zoom.y, target_zoom, zoom_speed * delta)

		# Detecta las teclas presionadas para mover la cámara
		var movement = Vector2.ZERO  # Vector inicial para el movimiento

		if Input.is_action_pressed("move_up"):
			movement.y -= 1
		if Input.is_action_pressed("move_down"):
			movement.y += 1
		if Input.is_action_pressed("move_left"):
			movement.x -= 1
		if Input.is_action_pressed("move_right"):
			movement.x += 1

		# Normaliza el vector para movimiento uniforme
		if movement != Vector2.ZERO:
			movement = movement.normalized()

		# Aplica el movimiento
		global_position += movement * speed * delta

		# Restringe la posición dentro de los límites
		global_position.x = clamp(global_position.x, limit_x_min, limit_x_max)
		global_position.y = clamp(global_position.y, limit_y_min, limit_y_max)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:  # El botón izquierdo del ratón
			if event.pressed:
				# Comienza a arrastrar
				dragging = true
				last_mouse_position = event.position
			else:
				# Detiene el arrastre
				dragging = false
	elif event is InputEventMouseMotion and dragging:
		# Mueve la cámara suavemente según el movimiento del ratón
		var mouse_delta = (last_mouse_position - event.position) * mouse_sensitivity
		global_position += mouse_delta

		# Actualiza la última posición del ratón
		last_mouse_position = event.position

		# Restringe la posición dentro de los límites
		global_position.x = clamp(global_position.x, limit_x_min, limit_x_max)
		global_position.y = clamp(global_position.y, limit_y_min, limit_y_max)
	
	# Maneja el zoom con la rueda del ratón
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		# Alejar (reducir el zoom)
		if current_zoom_index < zoom_levels.size() - 1:
			current_zoom_index += 1
			target_zoom = zoom_levels[current_zoom_index]["zoom"]
			apply_zoom_level(current_zoom_index)  # Aplica el nuevo nivel de zoom
			# Acercar (aumentar el zoom)
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		
		if current_zoom_index > 0:
			current_zoom_index -= 1
			target_zoom = zoom_levels[current_zoom_index]["zoom"]
			apply_zoom_level(current_zoom_index)  # Aplica el nuevo nivel de zoom

# Aplica el nivel de zoom y ajusta los límites de la cámara
func apply_zoom_level(index: int) -> void:
	var zoom_level = zoom_levels[index]
	limit_x_min = zoom_level["limits"]["x_min"]
	limit_x_max = zoom_level["limits"]["x_max"]
	limit_y_min = zoom_level["limits"]["y_min"]
	limit_y_max = zoom_level["limits"]["y_max"]
	print("Nuevo nivel de zoom aplicado: ", zoom_level["zoom"])
	print("Límites de cámara ajustados: X(", limit_x_min, " a ", limit_x_max, "), Y(", limit_y_min, " a ", limit_y_max, ")")
