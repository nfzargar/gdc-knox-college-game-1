extends Area2D
class_name InteractionArea

@export var input_binding : String
var areas_inside : Array[InteractableArea] = []


func _process(delta: float) -> void:
	# Handle Interactions
	if(Input.is_action_pressed(input_binding)):
		_activate_interactive_areas()
	elif(Input.is_action_just_released(input_binding)):
		_deactivate_interactive_areas()


func _activate_interactive_areas():
	for area in areas_inside:
		if(area is InteractableArea):
			area.activate()


func _deactivate_interactive_areas():
	for area in areas_inside:
		if(area is InteractableArea and area.holdable and area.activated_since_entering):
			area.deactivate()


func _on_area_entered(area: Area2D) -> void:
	if(area is InteractableArea):
		areas_inside.append(area)
		area.enter()


func _on_area_exited(area: Area2D) -> void:
	if(area is InteractableArea && area in areas_inside):
		areas_inside.erase(area)
		area.exit()
