extends CharacterBody2D

class_name Player

const SPEED = 60.0
var gameJam = load('res://scenes/GameJam.tscn')
var cooldown = false
var score = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta):
    velocity = SPEED * get_dir()
    move_and_slide()



func get_dir():
    var vec = Vector2(0,0)
    if Input.is_action_pressed('Left'):
        vec.x -= 1
    if Input.is_action_pressed('Right'):
        vec.x += 1
    if Input.is_action_pressed('Up'):
        vec.y -= 1
    if Input.is_action_pressed('Down'):
        vec.y += 1

    if Input.is_action_pressed('Attack') and !cooldown:
        drop_jam(gameJam)

    return vec



func drop_jam(jam):
    var j = jam.instantiate()
    j.position = self.position
    j.add_to_group('jam')
    self.get_parent().add_child(j)
    j.z_index = 1
    cooldown = true
    $Timer.start()



func _on_timer_timeout():
    $Timer.stop()
    cooldown = false



func _on_area_2d_body_entered(body):
    if body is Enemy:
        check_collision(body)



func check_collision(body):
    if body.jammed:
        body.queue_free()
        self.get_tree().root.get_child(0).increase_score()
    else:
        self.get_tree().root.get_child(0).end_game()
