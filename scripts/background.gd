extends Node2D

func _physics_process(delta):
	var sinValue1 = (sin(Global.time * 2) + 1.0) / 2.0
	var sinValue2 = (sin(Global.time * 0.7) + 1.0) / 2.0
	
	if int(round(Global.time))%3 == 0:
		$BG1.scale = Vector2(lerp(1.6, 2.5, sinValue1),1.3)
		$BG1.skew = lerp(-0.3, 0.3, sinValue2)
		$BG1.visible = true
		$BG2.visible = false
	else:
		$BG2.scale = Vector2(lerp(1.6, 2.5, sinValue1),1.3)
		$BG2.skew = lerp(-0.3, 0.3, sinValue2)
		$BG1.visible = false
		$BG2.visible = true
