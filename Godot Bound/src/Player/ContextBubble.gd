extends Node2D

signal activate_dialog
signal set_dialog

var dialog_active:= false
var dialog_string:= ""

onready var bubble_sprite:= $BubbleSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	bubble_sprite.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if bubble_sprite.visible:
			dialog_active = !dialog_active
			emit_signal("activate_dialog", dialog_active)
			emit_signal("set_dialog", dialog_string)


func change_sprite_visibility()->void:
	bubble_sprite.visible = !bubble_sprite.visible


func _on_Area2D_area_entered(area):
	if area.is_in_group("Interactable"):
		change_sprite_visibility()
		dialog_string = area.dialog_string


func _on_Area2D_area_exited(area):
	if area.is_in_group("Interactable"):
		change_sprite_visibility()
		dialog_active = false
		emit_signal("activate_dialog", dialog_active)
