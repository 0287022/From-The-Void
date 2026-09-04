extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Gameloop
func _process(delta: float) -> void:
	self.text="You have " + Format.f(GlobalGamestate.singularities) + " Singularities!"
	pass
