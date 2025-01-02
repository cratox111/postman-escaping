extends CharacterBody2D

const JUMP_VELOCITY = -650.0
var coins = 0

func _ready():
	$AnimatedSprite2D.play("run")

func _physics_process(delta):

	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if position.x < 559:
		velocity.x = 10
	elif position.x >= 559:
		velocity.x = 0
	
	
	animation()
	move_and_slide()

func animation():
	if velocity.y < 0:
		$AnimatedSprite2D.play("jump-impulse")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("fall-jump")
	else:
		$AnimatedSprite2D.play("run")
	


func _on_area_2d_area_entered(area):
	if area.name == "Moneda":
		area.get_parent().queue_free()
		coins += 1
