extends Node2D

@export var speed:int

func _physics_process(delta):
	position.x -= speed * delta
	if position.x < -5000:
		queue_free()
