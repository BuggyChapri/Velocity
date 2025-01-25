extends KinematicBody2D

func _physics_process(delta):
	Global.radius = (global_position - $Position2D.global_position).length()
	$AnimatedSprite.play("default")
