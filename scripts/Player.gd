extends CharacterBody2D


const SPEED = 50.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta):
    velocity = SPEED * getDir()
    move_and_slide()


func getDir():
    var vec = Vector2(0,0)
    if Input.is_action_pressed('Left'):
        vec.x -= 1
    if Input.is_action_pressed('Right'):
        vec.x += 1
    if Input.is_action_pressed('Up'):
        vec.y -= 1
    if Input.is_action_pressed('Down'):
        vec.y += 1

    return vec
