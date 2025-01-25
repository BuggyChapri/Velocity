extends Node2D

onready var satellite_file = preload("res://scene/satellite.tscn")
onready var earth = $earth

var velocity = Vector2()
var angle = 0.0
var orbit_radius = 250
var speed = 0.6

var satellite

func _process(delta):
	if Input.is_action_just_pressed("send"):
		Global.spawned = true
		satellite = satellite_file.instance()
		satellite.global_position = $earth/Position2D.global_position + Vector2(orbit_radius, 0)
		get_parent().add_child(satellite)
	
	if satellite:
		angle += speed * delta
		var orbit_position = Vector2(cos(angle), sin(angle)) * orbit_radius
		satellite.global_position = earth.global_position + orbit_position
		satellite.rotation_degrees += speed * delta
 
