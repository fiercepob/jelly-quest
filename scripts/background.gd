extends Area2D

var time = 0.0

func _physics_process(delta):
	time += delta
	var sinValue1 = (sin(time * 2) + 1.0) / 2.0
	var sinValue2 = (sin(time * 0.7) + 1.0) / 2.0
	
	if int(round(time))%3 == 0:
		$BG1.scale = Vector2(lerp(1.6, 2.5, sinValue1),1.3)
		$BG1.skew = lerp(-0.3, 0.3, sinValue2)
		$BG1.visible = true
		$BG2.visible = false
	else:
		$BG2.scale = Vector2(lerp(1.6, 2.5, sinValue1),1.3)
		$BG2.skew = lerp(-0.3, 0.3, sinValue2)
		$BG1.visible = false
		$BG2.visible = true
