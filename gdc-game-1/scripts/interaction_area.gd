extends Area2D
class_name InteractionArea

func _process(delta: float) -> void:
	# Handle Interactions
	if(Input.is_action_just_pressed("interact")):
		_activate_interactive_areas()
	var areas_inside = false
	for area in get_overlapping_areas():
		if(area is InteractionArea && area.show_prompt && !area.activated_since_entering):
			areas_inside = true

func _activate_interactive_areas():
	for area in get_overlapping_areas():
		if(area is InteractionArea):
			area.activate()
