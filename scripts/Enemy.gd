extends CharacterBody2D

class_name Enemy

const SPEED = 45.0
const MAIN_RADIUS = 300.0
const RUN_RADIUS = 100.0
var jammed = false

const RECT = Rect2(Vector2i(24, 24), Vector2i(440, 264))

@export var unjammed_texture: Texture2D
@export var jammed_texture: Texture2D

var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready():
    player = self.get_tree().root.get_child(0).player



func _physics_process(_delta: float) -> void:

    var dir = to_local(nav_agent.get_next_path_position()).normalized()
    velocity = dir * SPEED

    if jammed:
        $Sprite2D.texture = jammed_texture
    else:
        $Sprite2D.texture = unjammed_texture

    move_and_slide()



func makepath() -> void:
    var distance = self.position.distance_to(player.position) 
    var pos = Vector2(0,0)
    if !jammed:
        if distance >= MAIN_RADIUS:
            pos = global_position
        else:
            pos = player.global_position
    else:
        if distance >= RUN_RADIUS:
            pos = global_position
        else:
            pos = player.global_position - 2 * (player.global_position - global_position)

    pos = Vector2(
        clamp(pos.x, RECT.position.x, RECT.size.x),
        clamp(pos.y, RECT.position.y, RECT.size.y)
    )
    nav_agent.target_position = pos



func _on_timer_timeout():
    makepath()



func jamToast():
    nav_agent.target_position = player.global_position - 2 * (player.global_position - global_position)
    jammed = true
