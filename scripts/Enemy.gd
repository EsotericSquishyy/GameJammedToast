extends CharacterBody2D


const SPEED = 30.0
const RADIUS = 60.0
var jammed = false

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(_delta: float) -> void:
    if(self.position.distance_to(player.position) >= RADIUS):
        return

    var dir = to_local(nav_agent.get_next_path_position()).normalized()
    velocity = dir * SPEED
    if jammed:
        velocity *= -1

    move_and_slide()

func makepath() -> void:
    nav_agent.target_position = player.global_position


func _on_timer_timeout():
    makepath()
