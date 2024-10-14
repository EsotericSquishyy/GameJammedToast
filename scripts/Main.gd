extends Node

@export var player: Node2D
var score = 0

func end_game():
    call_deferred('switch_main')

func switch_main():
    get_tree().change_scene_to_file('res://scenes/Menu.tscn')

func increase_score():
    score += 1

func get_score():
    return score
