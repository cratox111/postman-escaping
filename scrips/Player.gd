extends CharacterBody2D

const JUMP_VELOCITY = -550.0

func _ready():
	$AnimatedSprite2D.play("run")

func _physics_process(delta):

	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	animation()
	move_and_slide()

func animation():
	if velocity.y < 0:
		$AnimatedSprite2D.play("jump-impulse")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("fall-jump")
	elif  velocity.y == 0:
		$AnimatedSprite2D.play("run")
	
