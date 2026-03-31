extends Area2D
class_name InteractionArea

@export var input_binding : String

func _process(delta: float) -> void:
	# Handle Interactions
	if(Input.is_action_just_pressed(input_binding)):
		_activate_interactive_areas()
	elif(Input.is_action_just_released(input_binding)):
		_deactivate_interactive_areas()


func _activate_interactive_areas():
	for area in get_overlapping_areas():
		if(area is InteractableArea):
			area.activate()


func _deactivate_interactive_areas():
	for area in get_overlapping_areas():
		if(area is InteractableArea and area.holdable and area.activated_since_entering):
			area.deactivate()


func _on_area_entered(area: Area2D) -> void:
	if(area is InteractableArea):
		area.enter()


func _on_area_exited(area: Area2D) -> void:
	if(area is InteractableArea && area in get_overlapping_areas()):
		area.exit()
