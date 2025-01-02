extends Node2D

var speed = 450

func _physics_process(delta):
	position.x -= speed * delta
	
	if position.x < -3200:
		queue_free()
