extends Button
var requirement

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	requirement = GlobalGamestate.level2_requirements[GlobalGamestate.level2_layers]
	if GlobalGamestate.singularities < requirement:
		text = "Requires " + Format.f(requirement) + " Singularities."
	else:
		text = "Pending Light: " + ""


func _on_pressed() -> void:
	if GlobalGamestate.singularities >= requirement:
		Gameloop.level2Reset(0)
	pass # Replace with function body.
