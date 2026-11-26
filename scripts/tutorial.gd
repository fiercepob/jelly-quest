extends Node2D

var mouseReleased = false
var slide = 0

func _ready():
	$slide1.visible = true

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseReleased:
		mouseReleased = false
		next_slide()
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		mouseReleased = true

func next_slide():
	slide += 1
	if slide >= 9:
		$"..".inTutorial = false
		queue_free()
	else:
		for child in get_children():
			child.visible = false
			get_child(slide).visible = true
