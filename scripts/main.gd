extends Node2D

onready var satellite_file = preload("res://scene/satellite.tscn")
onready var worm_file = preload("res://scene/boss1.tscn")
onready var earth = $earth  

var satellite
var worm
var setellie_count = Global.setellie_count

var random_number = RandomNumberGenerator.new()
var random_position


func _ready():
	random_number.randomize()

func _process(delta):
	spwan_boss()
	if Input.is_action_just_pressed("send"):
		Global.setellie_count += 1
		satellite = satellite_file.instance()
		add_child(satellite)
		satellite.global_position = earth.global_position + Vector2(Global.radius, 0)

func spwan_boss():
	if Global.setellie_count == 5 and not Global.is_spwaned:
		Global.is_spwaned = true  # Prevents multiple spawns
		random_position = random_number.randi_range(1, 4)

		# Spawn worm at a random position
		worm = worm_file.instance()
		match random_position:
			1: worm.global_position = $Position2D.global_position
			2: worm.global_position = $Position2D2.global_position
			3: worm.global_position = $Position2D3.global_position
			4: worm.global_position = $Position2D4.global_position

		add_child(worm)
		
