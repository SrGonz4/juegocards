extends Node3D

@export var escena_rey: PackedScene

func _ready():
	print("Iniciando mapa...")
	crear_reyes()

func crear_reyes():
	# Verificar que el Rey esté asignado
	if escena_rey == null:
		print("ERROR: No asignaste Rey.tscn en el inspector")
		return

	# Verificar que existen los puntos
	if not has_node("PosReyJugador") or not has_node("PosReyEnemigo"):
		print("ERROR: Faltan PosReyJugador o PosReyEnemigo")
		return

	# Obtener posiciones
	var pos_jugador = $PosReyJugador.global_transform.origin
	var pos_enemigo = $PosReyEnemigo.global_transform.origin

	# Crear Rey jugador
	var rey_jugador = escena_rey.instantiate()
	rey_jugador.global_transform.origin = pos_jugador
	rey_jugador.name = "ReyJugador"
	add_child(rey_jugador)

	print("Rey jugador creado")

	# Crear Rey enemigo
	var rey_enemigo = escena_rey.instantiate()
	rey_enemigo.global_transform.origin = pos_enemigo
	rey_enemigo.name = "ReyEnemigo"

	# Solo si existe la variable en el script del rey
	if "es_enemigo" in rey_enemigo:
		rey_enemigo.es_enemigo = true

	add_child(rey_enemigo)

	print("Rey enemigo creado")
