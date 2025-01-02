extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Score/CountScore.text = " " + str($"../Gui".score)
	$Coin/CountCoins.text = ": " + str($"../Player".coins)


func _on_button_reset_pressed():
	get_parent().get_tree().reload_current_scene()
	


func _on_button_home_pressed():
	pass # Replace with function body.
