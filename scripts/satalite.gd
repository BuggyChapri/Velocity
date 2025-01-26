extends KinematicBody2D

onready var earth = get_parent().get_node("earth")  
var speed = 65
var angle = 0.0
var radius = 0  
var collison

var is_colliding

var velocity = Vector2()

func _ready():
	is_colliding = false
	radius = Global.radius

func _process(delta):
	collided()

func _physics_process(delta):
	if earth:
		var angular_speed = deg2rad(speed)  
		angle += angular_speed * delta  
		rotation_degrees += speed * delta
		var orbit_position = Vector2(cos(angle), sin(angle)) * radius
		global_position = earth.global_position + orbit_position
		Global.spawned = true

	if collison:
		var other_setallite = collison.collider 
		if other_setallite is KinematicBody2D:  
			is_colliding = true

	collison = move_and_collide(velocity)

func collided():
	if is_colliding:
		queue_free()
