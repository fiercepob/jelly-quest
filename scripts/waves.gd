extends Area2D

var waveSpeed = 5

var i = randf()

func _ready():
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
	
	set_physics_process(true)
	
	if i < 0.5:
		position = Vector2(1300,393)
		$wave.flip_h = false
		$CollisionShape2D.position.x = -30
	else:
		position = Vector2(-137,393)
		$wave.flip_h = true
		$CollisionShape2D.position.x = 30

func _physics_process(delta):
	if i < 0.5:
		if position.x > -137:
			position.x -= waveSpeed
		else:
			queue_free()
	else:
		if position.x < 1300:
			position.x += waveSpeed
		else:
			queue_free()
