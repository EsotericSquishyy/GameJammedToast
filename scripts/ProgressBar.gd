extends ProgressBar

@export var timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    value = (float(timer.wait_time - timer.time_left) / float(timer.wait_time)) * max_value
