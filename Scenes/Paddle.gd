extends CharacterBody2D

const ball_scene = preload("res://Scenes/ball.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED_HIDDEN)
	
	
func _physics_process(delta):
	var y = position.y
	var mouse_x = get_viewport().get_mouse_position().x
	set_position(Vector2(mouse_x,y))
	
func _input(event):
	
	if Input.is_action_just_pressed("new_ball"):

		var ball = ball_scene.instantiate()
		ball.set_position(get_position() - Vector2(0, 16))
		get_parent().add_child(ball)
		get_viewport().set_input_as_handled()
		
	if Input.is_action_just_pressed("toggle_mouse_captured"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CONFINED_HIDDEN:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED_HIDDEN)

