extends Node

@onready var level_viewport: SubViewport = $HBoxContainer/SubViewportContainer/LevelViewport
@onready var interior_viewport: SubViewport = $HBoxContainer/SubViewportContainer2/InteriorViewport

@export var opening_scene : PackedScene
var current_level = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Autoload.game_manager = self
	set_level(opening_scene)


func set_level(level: PackedScene):
	if(is_instance_valid(current_level)):
		remove_child(current_level)
		current_level.queue_free()
	var new_level = level.instantiate()
	current_level = new_level
	level_viewport.add_child(new_level)
