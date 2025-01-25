extends Node2D

onready var satellite_file = preload("res://scene/satellite.tscn")
onready var earth = $earth  

var satellite

func _process(delta):
	if Input.is_action_just_pressed("send"):
		satellite = satellite_file.instance()
		add_child(satellite)
		satellite.global_position = earth.global_position + Vector2(Global.radius, 0)
