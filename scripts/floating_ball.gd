extends Area2D

var waveSpeed = 0

var i = randf()

func _ready():
	
	if Global.level > 2 and Global.level < 7:
		waveSpeed = 5
	else:
		waveSpeed = 7
	
	$wave.visible = false
	Global.canDieFromFloatingBall = false
	set_physics_process(false)
	
	if i < 0.5:
		$warning.position = Vector2(1108,132)
	else:
		$warning.position = Vector2(40,132)
	$warning.modulate = Color(0.25,0.75,0.25,1.0)
	$warning.visible = true
	await get_tree().create_timer(Global.warningHeatInterval).timeout
	$warning.modulate = Color(1.0, 0.76, 0.14, 1.0)
	await get_tree().create_timer(Global.warningHeatInterval).timeout
	$warning.modulate = Color(1.0, 0.349, 0.0, 1.0)
	await get_tree().create_timer(Global.warningHeatInterval).timeout
	$warning.modulate = Color(1.0, 0.0, 0.0, 1.0)
	await get_tree().create_timer(Global.warningHeatInterval).timeout
	$warning.visible = false
	
	if i < 0.5:
		position = Vector2(1222,68)
	else:
		position = Vector2(-68,68)
	
	$wave.visible = true
	Global.canDieFromFloatingBall = true
	set_physics_process(true)

func _physics_process(delta):
	if i < 0.5:
		if position.x > -137:
			position.x -= waveSpeed
			rotation_degrees -= waveSpeed * 0.8
		else:
			queue_free()
	else:
		if position.x < 1300:
			position.x += waveSpeed
			rotation_degrees += waveSpeed * 0.8
		else:
			queue_free()
	
	var sinValue = (sin(Global.time * 4.5) + 1.0) / 2.0
	position.y = lerp(64, 195, sinValue)
