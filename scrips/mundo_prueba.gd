extends Node2D


var Suelo1:PackedScene = preload("res://scenes/Suelos/Suelo1.tscn")
var Suelo2:PackedScene = preload("res://scenes/Suelos/Suelo2.tscn")
var Suelo3:PackedScene = preload("res://scenes/Suelos/Suelo3.tscn")
var Suelo4:PackedScene = preload("res://scenes/Suelos/Suelo4.tscn")
var time_out = false
var posicion

func _ready():
	$Timer.start()


func _process(delta):
	if time_out:
		generar_suelo()
		time_out = false
	

func generar_suelo():
	var posicion = randi_range(300, 450)
	var suelos = [Suelo1, Suelo3, Suelo4]
	var suelo_elegido = suelos[randi_range(0, suelos.size() - 1)].instantiate()
	suelo_elegido.global_position = Vector2(1200, posicion)
	get_parent().add_child(suelo_elegido)
	


func _on_timer_timeout():
	time_out = true
