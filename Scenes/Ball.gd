extends RigidBody2D

@export var SPEEDUP: = 4
@export var MAXSPEED: = 400


# Called when the node enters the scene tree for the first time.
#func _ready():
#	set_physics_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			body.queue_free()
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = position - body.get_node("Anchor").get_global_position()
			var velocity = direction * min(speed + SPEEDUP, MAXSPEED * delta)
			set_linear_velocity(velocity)
	
	if position.y > get_viewport_rect().end.y:
		queue_free()	

