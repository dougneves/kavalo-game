extends Control

var level1: PackedScene = preload("res://scenes/level1.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_packed(level1)
