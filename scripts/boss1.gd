extends KinematicBody2D

onready var earth = get_parent().get_node("earth")

var velocity = Vector2()
var speed = 60
var move_direction
var timer = 0.0  # For sine wave movement

var random_mover = RandomNumberGenerator.new()

func _ready():
	random_mover.randomize()
	speed = random_mover.randi_range(40, 100)  # Random speed
	move_direction = (earth.global_position - global_position).normalized()  # Move toward Earth

func _physics_process(delta):
	move_stage_1(delta)

func move_stage_1(delta):
	timer += delta * speed * 0.5  # Increase over time
	var sine_wave = Vector2(0, sin(timer) * 20)  # Wiggly movement
	velocity = move_direction * speed + sine_wave  # Move toward Earth with oscillation
	move_and_collide(velocity * delta)
