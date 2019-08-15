extends CanvasLayer

onready var dialog_label:= $Window/Label
onready var window:= $Window

# Called when the node enters the scene tree for the first time.
func _ready():
	window.visible = false


func set_dialog(new_dialog: String):
	dialog_label.text = new_dialog


func change_window_state(new_state: bool):
	window.visible = new_state

func _on_ContextBubble_activate_dialog(new_state: bool):
	change_window_state(new_state)


func _on_ContextBubble_set_dialog(new_dialog: String):
	set_dialog(new_dialog)
	pass # Replace with function body.
