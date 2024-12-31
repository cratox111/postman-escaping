extends Node2D


var Suelo1:PackedScene = preload("res://scenes/Suelos/Suelo1.tscn")
var Suelo2:PackedScene = preload("res://scenes/Suelos/Suelo2.tscn")
var Suelo3:PackedScene = preload("res://scenes/Suelos/Suelo3.tscn")
var Suelo4:PackedScene = preload("res://scenes/Suelos/Suelo4.tscn")
var menu_dead:PackedScene = preload("res://scenes/other/MenuDead.tscn")
var time_out = false
var posicion
var you_lost = false

func _ready():
	$Timer.start()

func _process(delta):
	if time_out:
		generar_suelo()
		time_out = false
	
	if $Player.global_position.x < -10 or $Player.global_position.y > 3000:
		var new_menu_dead = menu_dead.instantiate()
		get_parent().add_child(new_menu_dead)
		you_lost = true
	
	print($Player.global_position.y)

func generar_suelo():
	if not you_lost:
		var posicion = randi_range(750, 950)
		var suelos = [Suelo1, Suelo3, Suelo4]
		var suelo_elegido = suelos[randi_range(0, suelos.size() - 1)].instantiate()
		suelo_elegido.global_position = Vector2(2750, posicion)
		get_parent().add_child(suelo_elegido)
	


func _on_timer_timeout():
	time_out = true
