extends CharacterBody2D

@export var speed = 300
var jump = 200

var gravedad = +100

func _physics_process(delta):
	if not is_on_floor():
		velocity.y = gravedad
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump
		
	move_and_slide()
