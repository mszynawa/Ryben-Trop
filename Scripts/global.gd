extends Node

var playerName = "Player1"

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