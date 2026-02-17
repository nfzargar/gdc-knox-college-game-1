extends Area2D
class_name InteractionArea

@export var input_binding : String

func _process(delta: float) -> void:
	# Handle Interactions
	if(Input.is_action_pressed(input_binding)):
		_activate_interactive_areas()
	else:
		_deactivate_interactive_areas()
	var areas_inside = false
	for area in get_overlapping_areas():
		if(area is InteractableArea):
			if(area.show_prompt && !area.activated_since_entering):
				areas_inside = true
			if(!area.is_inside):
				area.enter()

func _activate_interactive_areas():
	for area in get_overlapping_areas():
		if(area is InteractableArea):
			area.activate()
			
func _deactivate_interactive_areas():
	for area in get_overlapping_areas():
		if(area is InteractableArea and area.holdable and area.activated_since_entering):
			area.deactivate()
