extends Node

signal game_over

var player: Player
# É um SingleTone que está acima do otdo e todos podem se comunicar com ele. Deve ser adicionado em AUTOLOAD de settngs
var player_position: Vector2
var is_game_over: bool = false

var time_elapsed: float = 0.0
var time_elapsed_string: String
var meat_counter: int= 0
var monsters_defetad_counter: int = 0


func _process(delta: float):
	# Update Timer
	time_elapsed += delta
	var time_elapsed_in_seconds: int = floori(time_elapsed) 
	var seconds: int = time_elapsed_in_seconds % 60
	var minutes: int = time_elapsed_in_seconds / 60	
	# % < para formatar variável, 02< quantidade de digitos,  d < digitos
	time_elapsed_string = "%02d:%02d" % [minutes, seconds]

func end_game():
	if is_game_over: return
	is_game_over = true
	game_over.emit()
	
func reset():
	player = null
	player_position = Vector2.ZERO
	is_game_over = false
	
	time_elapsed= 0.0
	time_elapsed_string = "00:00"
	meat_counter = 0
	monsters_defetad_counter = 0
	
	for connection in game_over.get_connections():
		game_over.disconnect(connection.callable)
