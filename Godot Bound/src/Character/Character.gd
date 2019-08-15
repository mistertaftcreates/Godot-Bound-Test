extends KinematicBody2D

export var speed:= 64.0
onready var anim_player:= $AnimationPlayer


func motion(direction: Vector2, magnitude: float):
	move_and_slide(direction.normalized() * magnitude, Vector2.ZERO)


func change_animation(anim_name: String):
	if anim_player.current_animation != anim_name:
		anim_player.current_animation = anim_name


func rounded_vector(direction: Vector2)->Vector2:
	var direction_angle = rad2deg(atan2(direction.y, direction.x))
	if direction_angle > 45 and direction_angle <= 135:
		return Vector2.DOWN
	if direction_angle > 135 or direction_angle <-135:
		return Vector2.LEFT
	if direction_angle < -45 and direction_angle >= -135:
		return Vector2.UP
	if direction_angle > -45 and direction_angle <= 45:
		return Vector2.RIGHT
	return Vector2.DOWN