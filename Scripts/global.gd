extends Node

var playerName = "Player 1"

var playerScore = 0

func getPlayerName():
	return playerName

func getPlayerScore():
	return playerScore

func setPlayerScore(score):
	playerScore = playerScore + score
	pass
	
func restartPlayerScore():
	playerScore = 0
	pass

# SCOREBOARD
var bestscore = 0 setget set_bestscore
const filepath = "user:scoreboard.data"

func _ready():
	load_scoreboard()
	print(bestscore)
	pass

func load_scoreboard():
	var file = File.new()
	if not file.file_exists(filepath): return
	file.open(filepath, File.READ)
	bestscore = file.get_var()
	file.close()
	pass

func save_bestscore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(bestscore)
	file.close()
	pass
	
func set_bestscore(new_value):
	bestscore = new_value
	save_bestscore()
	pass