extends Node2D

class_name GameJam

const SPRITE_COUNT = 4
const SPRITE_WIDTH = 16
const SPRITE_HEIGHT = 16

# Called when the node enters the scene tree for the first time.
func _ready():
    var random_index = randi() % SPRITE_COUNT
    var offset = random_index * SPRITE_WIDTH

    $Sprite2D.region_rect = Rect2(offset, 0, SPRITE_WIDTH, SPRITE_HEIGHT)



func _on_area_2d_body_entered(body):
    if body is Enemy:
        body.jamToast()
        self.queue_free()
