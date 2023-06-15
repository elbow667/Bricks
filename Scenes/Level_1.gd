extends Node2D

@onready var redbrick_scene: = preload("res://Scenes/red_brick.tscn")

func _ready():
	
	for n in range(320, 1280, 64):
		for i in range(128, 320, 32):
#			print_debug(str(n)+","+str(i))
			var brick = redbrick_scene.instantiate()
			get_parent().call_deferred("add_child",brick)
			brick.position = Vector2i(n,i)
	

