extends Label

@export var main: Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    text = 'Jammed toast eaten: ' + str(main.get_score())
