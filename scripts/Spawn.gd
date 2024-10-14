extends Node2D

@export var spawnPoints: Array[Vector2]
@onready var enemy_scene = load('res://scenes/Enemy.tscn')

func _ready():
    spawn_enemy(enemy_scene)



func _on_timer_timeout():
    spawn_enemy(enemy_scene)



func spawn_enemy(enemy):
    var random_index = randi() % spawnPoints.size()
    var spawn = spawnPoints[random_index]

    var e = enemy.instantiate()
    e.position = spawn
    e.add_to_group('enemy')
    add_child(e)
    e.z_index = 3
