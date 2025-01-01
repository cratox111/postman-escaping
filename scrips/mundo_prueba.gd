extends Node2D


var Suelo1:PackedScene = preload("res://scenes/Suelos/Suelo1.tscn")
var Suelo2:PackedScene = preload("res://scenes/Suelos/Suelo2.tscn")
var Suelo3:PackedScene = preload("res://scenes/Suelos/Suelo3.tscn")
var Suelo4:PackedScene = preload("res://scenes/Suelos/Suelo4.tscn")
var time_out = false
var posicion
var you_lost = false

func _ready():
	$SpawFloor.start()

func _process(delta):
	if time_out:
		generar_suelo()
		time_out = false
	
	if $Player.global_position.x < -100 or $Player.global_position.y > 2000:
		$MenuDead.global_position = Vector2(1280, 720)
		you_lost = true

func generar_suelo():
	if not you_lost:
		var posicion = randi_range(750, 950)
		var suelos = [Suelo1, Suelo3, Suelo4]
		var suelo_elegido = suelos[randi_range(0, suelos.size() - 1)].instantiate()
		suelo_elegido.global_position = Vector2(2750, posicion)
		get_parent().add_child(suelo_elegido)
		
		suelo_elegido.speed = 450
		
		if $Gui.score > 300:
			suelo_elegido.speed = 500
		elif $Gui.score > 500:
			suelo_elegido.speed = 550
		print(suelo_elegido.speed)


func _on_timer_timeout():
	time_out = true
