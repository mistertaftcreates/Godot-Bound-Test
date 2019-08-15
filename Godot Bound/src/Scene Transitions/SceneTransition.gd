extends Area2D

export var next_scene:= ""
export var next_position:= Vector2.ZERO

onready var collision_shape:= $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_SceneTransition_body_entered(body):
	if body.is_in_group("Player"):
		new_script.set_scene_to_load(next_scene)
		new_script.store_player_pos(next_position)
		new_script.load_new_scene()
