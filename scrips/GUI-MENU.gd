extends CanvasLayer

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Container/TextScore/CountScore.text = str(score)
	$Container/Coins/CountCoins.text = ": " + str($"../Player".coins)



func _on_timer_timeout():
	if not $"..".you_lost:
		score += 1
