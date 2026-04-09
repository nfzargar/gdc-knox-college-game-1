extends Node2D
var originY
var speed = .004


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	originY = position.y # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = originY + sin(Time.get_ticks_msec()*speed) * 10.0


func _on_area_2d_body_entered(body: Node2D) -> void:
	print ("hi") # Replace with function body.
