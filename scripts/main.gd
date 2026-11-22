extends Node2D

var game_level_scene = preload("res://game_level.tscn")
var shop_scene = preload("res://shop.tscn")

func _ready():
	Global.reload_game()
	Global.roundStart.connect(round_start)
	Global.roundEnd.connect(round_end)

func round_start():
	Global.gameRunning = true
	var game_level = game_level_scene.instantiate()
	add_child(game_level)

func round_end():
	Global.gameRunning = false
	await get_tree().create_timer(1).timeout
	if Global.level == 1:
		var shop = shop_scene.instantiate()
		add_child(shop)
