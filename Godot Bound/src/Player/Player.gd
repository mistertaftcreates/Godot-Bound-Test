extends "res://src/Character/Character.gd"

export var left_limit:= -100
export var right_limit: = 300
export var top_limit:= -100
export var bottom_limit:= 400


var temp_movement:= Vector2.ZERO
var last_move:= Vector2.ZERO
var moving = false


onready var player_cam:= $Camera2D


func _ready():
	change_animation("idle down")
	set_camera_limits()


func set_camera_limits():
	player_cam.limit_left = left_limit
	player_cam.limit_right = right_limit
	player_cam.limit_top = top_limit
	player_cam.limit_bottom = bottom_limit


func _process(delta):
	temp_movement = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"), 
		Input.get_action_strength("down") - Input.get_action_strength("up"))
	motion(temp_movement, speed)
	if temp_movement.length() > 0:
		moving = true
		last_move = temp_movement
		find_direction_and_animate(temp_movement)
	else:
		moving = false
		find_direction_and_animate(last_move)


func find_direction_and_animate(direction: Vector2):
	var direction_vector = rounded_vector(direction)
	match direction_vector:
		Vector2.UP:
			if moving:
				change_animation("walk up")
			else:
				change_animation("idle up")
		Vector2.DOWN:
			if moving:
				change_animation("walk down")
			else:
				change_animation("idle down")
		Vector2.RIGHT:
			if moving:
				change_animation("walk right")
			else:
				change_animation("idle right")
		Vector2.LEFT:
			if moving:
				change_animation("walk left")
			else:
				change_animation("idle left") 
	