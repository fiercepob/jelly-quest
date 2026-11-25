extends Area2D

var Interval = 0
var xPos = 0
var yPos = 0
var laserLifetime = 0

func _ready():
	
	if Global.level == 1:
		Global.warningHeatInterval = 0.8
		laserLifetime = 0.6
	elif Global.level == 2:
		Global.warningHeatInterval = 0.7
		laserLifetime = 0.9
	elif Global.level > 2 and Global.level < 7:
		Global.warningHeatInterval = 0.6
		laserLifetime = 1.2
	else:
		Global.warningHeatInterval = 0.4
		laserLifetime = 1.5
	
	while true:
		await get_tree().create_timer(Interval).timeout
		xPos = randi_range(100,1090)
		yPos = 50
		
		rotation = 0.0
		position = Vector2(xPos, yPos)
		$warning.modulate = Color(0.25,0.75,0.25,1.0)
		$warning.visible = true
		$arrow.rotation_degrees = 90.0
		$arrow.position = Vector2(0, 70)
		$arrow.visible = true
		await get_tree().create_timer(Global.warningHeatInterval).timeout
		$warning.modulate = Color(1.0, 0.76, 0.14, 1.0)
		await get_tree().create_timer(Global.warningHeatInterval).timeout
		$warning.modulate = Color(1.0, 0.349, 0.0, 1.0)
		await get_tree().create_timer(Global.warningHeatInterval).timeout
		$warning.modulate = Color(1.0, 0.0, 0.0, 1.0)
		await get_tree().create_timer(Global.warningHeatInterval).timeout
		$warning.visible = false
		$arrow.visible = false
		
		rotation_degrees = 90.0
		$laser.flip_h = false
		position = Vector2(xPos, 576)
		$laser.visible = true
		await get_tree().create_timer(laserLifetime).timeout
		$laser.visible = false
