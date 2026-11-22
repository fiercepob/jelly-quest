extends Area2D

var Interval = 0
var xPos = 0
var yPos = 0
var heatInterval = 1
var direction = "a"
var laserLifetime = 0.4

func _ready():
	if Global.level == 1:
		Global.verticalLaserChance = 1
	else:
		Global.verticalLaserChance = 0.6
	
	while Global.gameRunning:
		await get_tree().create_timer(Interval).timeout
		if Global.level == 1 and Global.time > 20:
			Global.verticalLaserChance = 0
		var i = randf()
		if i < Global.verticalLaserChance:
			xPos = randi_range(100,1090)
			yPos = 50
			direction = "top"
		else:
			i = randi_range(0,1)
			if i == 0:
				xPos = 1100
				direction = "right"
			else:
				xPos = 50
				direction = "left"
			yPos = randi_range(100, 475)
		
		rotation = 0.0
		position = Vector2(xPos, yPos)
		$warning.modulate = Color(0.25,0.75,0.25,1.0)
		$warning.visible = true
		if direction == "top":
			$arrow.rotation_degrees = 90.0
			$arrow.position = Vector2(0, 70)
		elif direction == "left":
			$arrow.rotation_degrees = 0.0
			$arrow.position = Vector2(70, 0)
		else:
			$arrow.rotation_degrees = 180.0
			$arrow.position = Vector2(-70, 0)
		$arrow.visible = true
		await get_tree().create_timer(heatInterval).timeout
		$warning.modulate = Color(1.0, 0.76, 0.14, 1.0)
		await get_tree().create_timer(heatInterval).timeout
		$warning.modulate = Color(1.0, 0.349, 0.0, 1.0)
		await get_tree().create_timer(heatInterval).timeout
		$warning.modulate = Color(1.0, 0.0, 0.0, 1.0)
		await get_tree().create_timer(heatInterval).timeout
		$warning.visible = false
		$arrow.visible = false
		
		if direction == "top":
			rotation_degrees = 90.0
			$laser.flip_h = false
			position = Vector2(xPos, 576)
		elif direction == "left":
			rotation = 0.0
			$laser.flip_h = false
			position = Vector2(580, yPos)
		elif direction == "right":
			rotation = 0.0
			$laser.flip_h = true
			position = Vector2(580, yPos)
		$laser.visible = true
		await get_tree().create_timer(laserLifetime).timeout
		$laser.visible = false
