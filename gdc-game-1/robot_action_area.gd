extends InteractableArea

@export var action : String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(activated_since_entering):
		Input.action_press(action)
		$Sprite.frame = 1
	elif(Input.is_action_pressed(action)):
		Input.action_release(action)
		$Sprite.frame = 0


func _on_deactivated() -> void:
	print_debug("deactivated")
