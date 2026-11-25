extends Area2D

var waveSpeed = 0

var i = randf()

func _ready():
	
	if Global.level == 1:
		waveSpeed = 5
	elif Global.level == 2:
		waveSpeed = 6
	elif Global.level > 2 and Global.level < 7:
		waveSpeed = 8
	else:
		waveSpeed = 10
	
	$wave.visible = false
	Global.canDieFromWave = false
	set_physics_process(false)
	
	if i < 0.5:
		$warning.position = Vector2(1108,365)
	else:
		$warning.position = Vector2(40,365)
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
		position = Vector2(1300,396)
	else:
		position = Vector2(-137,396)
	
	$wave.visible = true
	Global.canDieFromWave = true
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
