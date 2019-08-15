extends Node

export var max_value: = 10.0
var current_value: = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	change_value(max_value)


func take_damage(damage_amount: float):
	current_value -= damage_amount
	if current_value < 0:
		current_value = 0


func total_damage():
	current_value = 0


func heal(heal_amount: float):
	current_value += heal_amount
	if current_value > max_value:
		current_value = max_value


func total_heal():
	current_value = max_value



func change_value(change_amount: float):
	current_value += change_amount
	if current_value > max_value:
		current_value = max_value
	if current_value < 0:
		current_value = 0
