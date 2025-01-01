extends CanvasLayer

var score = 0 

func _process(delta):
	$Container/TextScore/CountScore.text = str(score)
	$Container/Coins/CountCoins.text = ": " + str($"../Player".coins)
	

func _on_count_score_timeout():
	if not $"..".you_lost:
		score += 1
