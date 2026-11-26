extends Node2D

var tutorial_scene = preload("res://tutorial.tscn")

var time = 0.0
var keyReleased = false
var mouseReleased = false

var mouseTouchingNext = false
var mouseTouchingPrev = false
var mouseTouchingTut = false
var inTutorial = false

func _process(delta):
	time += delta
	var sinValue = (sin(time * 4) + 1.0) / 2.0
	$playButton.scale = Vector2(lerp(0.9,1.0 , sinValue), lerp(0.9, 1.0, sinValue))
	if not inTutorial:
		if Input.is_key_pressed(KEY_SPACE):
			space_pressed()
			set_process(false)
		
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingNext and mouseReleased:
			if Global.playerSprite == 5:
				Global.playerSprite = 1
			else:
				Global.playerSprite += 1
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingPrev and mouseReleased:
			if Global.playerSprite == 1:
				Global.playerSprite = 5
			else:
				Global.playerSprite -= 1
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingTut and mouseReleased:
			inTutorial = true
			var tutorial = tutorial_scene.instantiate()
			add_child(tutorial)
		if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			mouseReleased = true
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseReleased:
			mouseReleased = false

func space_pressed():
	$playButton.modulate = Color(0.8,0.8,0.8,1.0)
	$playButton.scale = Vector2(0.8,0.8)
	while true:
		if not Input.is_key_pressed(KEY_SPACE):
			break
		else:
			await get_tree().create_timer(0.05).timeout
	Global.roundStart.emit()
	queue_free()

func _on_next_player_mouse_entered() -> void:
	$nextPlayer.modulate = Color(0.6,0.6,0.6,1)
	mouseTouchingNext = true
func _on_next_player_mouse_exited() -> void:
	$nextPlayer.modulate = Color(1,1,1,1)
	mouseTouchingNext = false

func _on_previous_player_mouse_entered() -> void:
	$previousPlayer.modulate = Color(0.6,0.6,0.6,1)
	mouseTouchingPrev = true
func _on_previous_player_mouse_exited() -> void:
	$previousPlayer.modulate = Color(1,1,1,1)
	mouseTouchingPrev = false

func _on_tutorial_button_mouse_entered() -> void:
	$tutorialButton.modulate = Color(0.6,0.6,0.6,1)
	mouseTouchingTut = true
func _on_tutorial_button_mouse_exited() -> void:
	$tutorialButton.modulate = Color(1,1,1,1)
	mouseTouchingTut = false
