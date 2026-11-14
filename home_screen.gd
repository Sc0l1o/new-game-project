extends Control

var tutorial = preload("res://main_game.tscn")
var main_game = preload("res://tutorial.tscn")
@onready var buttons_menu = $CenterContainer/buttons
@onready var credits_menu = $CenterContainer/credits

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(main_game)

func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_packed(tutorial)

func _on_credits_pressed() -> void:
	print("help me")
	buttons_menu.visible = false
	credits_menu.visible = true

func _on_back_pressed() -> void:
	buttons_menu.visible = true
	credits_menu.visible = false
