extends KinematicBody2D

onready var earth = get_parent().get_node("earth")  
var speed = 65
var angle = 0.0
var radius = 0  

func _ready():
	radius = Global.radius

func _physics_process(delta):
	if earth:
		var angular_speed = deg2rad(speed)  
		angle += angular_speed * delta  
		rotation_degrees += speed * delta
		var orbit_position = Vector2(cos(angle), sin(angle)) * radius
		global_position = earth.global_position + orbit_position
