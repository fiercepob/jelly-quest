extends CanvasLayer

func _process(delta):
	$LevelDisplay.text = "Level: " + str(Global.level) + "/10"
	$PointsDisplay.text = "Points: " + str(Global.points)
	if Global.gameRunning == true:
		visible = true
	else:
		visible = false
	
	if Global.slamCooldownTimer > 0:
		$SlamCooldown.visible = true
		$SlamCooldown/Label.text = str(snapped(Global.slamCooldownTimer,0.1))
	else:
		$SlamCooldown.visible = false
	
	if Global.freezeCooldownTimer > 0:
		$FreezeCooldown.visible = true
		$FreezeCooldown/Label.text = str(snapped(Global.freezeCooldownTimer,0.1))
	else:
		$FreezeCooldown.visible = false
		
	if Global.level == 10:
		$PointsDisplay.visible = false
