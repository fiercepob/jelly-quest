extends Node2D

var shop_sold_scene = preload("res://shop_sold.tscn")

var mouseTouchingDoublejump = false
var mouseTouchingSlam = false
var mouseTouchingFreeze = false
var mouseTouchingRegen = false
var mouseTouchingCoinspawnrate = false
var mouseTouchingGoldcoinchance = false
var mouseTouchingFreezeduration = false
var mouseTouchingBossfightmaxhealth = false
var mouseTouchingNextround = false
var mouseTouchingRestart = false

var mouseReleased = false
var timesClickedRestart = 0

var timesBoughtCoinspawnrate = 0
var timesBoughtGoldcoinchance = 0
var timesBoughtFreezeduration = 0
var timesBoughtBossfightmaxhealth = 0

func _ready():
	Global.roundEnd.connect(on_round_end)
func on_round_end():
	visible = true

func _process(delta):
	$pointDisplay.text = "Points: " + str(Global.points)
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		mouseReleased = true
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingDoublejump and mouseReleased:
		if Global.points >= 10: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
			Global.points -= 10
			Global.canDoubleJump = true
			var shop_sold = shop_sold_scene.instantiate()
			shop_sold.position = Vector2(854,165)
			shop_sold.rotation_degrees = randi_range(-20,20)
			add_child(shop_sold)
			$doubleJump.input_pickable = false
			$doubleJump/price.visible = false
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingSlam and mouseReleased:
		if Global.points >= 20: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
			Global.points -= 20
			Global.canSlam = true
			var shop_sold = shop_sold_scene.instantiate()
			shop_sold.position = Vector2(854,289)
			shop_sold.rotation_degrees = randi_range(-20,20)
			add_child(shop_sold)
			$slam.input_pickable = false
			$slam/price.visible = false
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingFreeze and mouseReleased:
		if Global.points >= 40: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
			Global.points -= 40
			Global.canFreeze = true
			var shop_sold = shop_sold_scene.instantiate()
			shop_sold.position = Vector2(854,412)
			shop_sold.rotation_degrees = randi_range(-20,20)
			add_child(shop_sold)
			$freeze.input_pickable = false
			$freeze/price.visible = false
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingRegen and mouseReleased:
		if Global.points >= 40: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
			Global.points -= 40
			Global.canRegen = true
			var shop_sold = shop_sold_scene.instantiate()
			shop_sold.position = Vector2(854,549)
			shop_sold.rotation_degrees = randi_range(-20,20)
			add_child(shop_sold)
			$regen.input_pickable = false
			$regen/price.visible = false
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingCoinspawnrate and mouseReleased:
		if timesBoughtCoinspawnrate == 0:
			if Global.points >= 5: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 5
				Global.pointSpawnRate = 1.3333
				$coinSpawnRate/upgradeDisplay.text = "0.75/second"
				$coinSpawnRate/price.text = "10" + " Points"
				timesBoughtCoinspawnrate += 1
		elif timesBoughtCoinspawnrate == 1:
			if Global.points >= 10: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 10
				Global.pointSpawnRate = 1
				$coinSpawnRate/upgradeDisplay.text = "1/second"
				$coinSpawnRate/price.text = "20" + " Points"
				timesBoughtCoinspawnrate += 1
		elif timesBoughtCoinspawnrate == 2:
			if Global.points >= 20: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 20
				Global.pointSpawnRate = 0.8
				$coinSpawnRate/upgradeDisplay.text = "1.25/second"
				$coinSpawnRate/price.text = "30" + " Points"
				timesBoughtCoinspawnrate += 1
		elif timesBoughtCoinspawnrate == 3:
			if Global.points >= 30: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 30
				Global.pointSpawnRate = 0.6667
				$coinSpawnRate/upgradeDisplay.text = "1.5/second"
				$coinSpawnRate/price.visible = false
				$coinSpawnRate.input_pickable = false
				var shop_sold = shop_sold_scene.instantiate()
				shop_sold.position = Vector2(532,140)
				shop_sold.scale = Vector2(0.75,0.75)
				shop_sold.rotation_degrees = randi_range(-20,20)
				add_child(shop_sold)
				timesBoughtCoinspawnrate += 1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingGoldcoinchance and mouseReleased:
		if timesBoughtGoldcoinchance == 0:
			if Global.points >= 5: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 5
				Global.goldPointChance = 0.25
				$goldCoinChance/upgradeDisplay.text = "25% chance"
				$goldCoinChance/price.text = "10" + " Points"
				timesBoughtGoldcoinchance += 1
		elif timesBoughtGoldcoinchance == 1:
			if Global.points >= 10: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 10
				Global.goldPointChance = 0.5
				$goldCoinChance/upgradeDisplay.text = "50% chance"
				$goldCoinChance/price.text = "20" + " Points"
				timesBoughtGoldcoinchance += 1
		elif timesBoughtGoldcoinchance == 2:
			if Global.points >= 20: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 20
				Global.goldPointChance = 0.75
				$goldCoinChance/upgradeDisplay.text = "75% chance"
				$goldCoinChance/price.text = "30" + " Points"
				timesBoughtGoldcoinchance += 1
		elif timesBoughtGoldcoinchance == 3:
			if Global.points >= 30: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 30
				Global.goldPointChance = 1
				$goldCoinChance/upgradeDisplay.text = "100% chance"
				$goldCoinChance/price.visible = false
				$goldCoinChance.input_pickable = false
				var shop_sold = shop_sold_scene.instantiate()
				shop_sold.position = Vector2(532,264)
				shop_sold.scale = Vector2(0.75,0.75)
				shop_sold.rotation_degrees = randi_range(-20,20)
				add_child(shop_sold)
				timesBoughtGoldcoinchance += 1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingFreezeduration and mouseReleased:
		if timesBoughtFreezeduration == 0:
			if Global.points >= 5: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 5
				Global.freezeDuration = 2
				$freezeDuration/upgradeDisplay.text = "2 seconds"
				$freezeDuration/price.text = "15" + " Points"
				timesBoughtFreezeduration += 1
		elif timesBoughtFreezeduration == 1:
			if Global.points >= 15: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 15
				Global.freezeDuration = 3
				$freezeDuration/upgradeDisplay.text = "3 seconds"
				$freezeDuration/price.text = "40" + " Points"
				timesBoughtFreezeduration += 1
		elif timesBoughtFreezeduration == 2:
			if Global.points >= 40: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 40
				Global.freezeDuration = 1000
				$freezeDuration/upgradeDisplay.text = "infinite"
				$freezeDuration/price.visible = false
				$freezeDuration.input_pickable = false
				var shop_sold = shop_sold_scene.instantiate()
				shop_sold.position = Vector2(532,393)
				shop_sold.scale = Vector2(0.75,0.75)
				shop_sold.rotation_degrees = randi_range(-20,20)
				add_child(shop_sold)
				timesBoughtFreezeduration += 1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingBossfightmaxhealth and mouseReleased:
		if timesBoughtBossfightmaxhealth == 0:
			if Global.points >= 5: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 5
				Global.bossfightMaxHealth = 150
				$bossfightMaxHealth/upgradeDisplay.text = "150 health"
				$bossfightMaxHealth/price.text = "10" + " Points"
				timesBoughtBossfightmaxhealth += 1
		elif timesBoughtBossfightmaxhealth == 1:
			if Global.points >= 10: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 10
				Global.bossfightMaxHealth = 200
				$bossfightMaxHealth/upgradeDisplay.text = "200 health"
				$bossfightMaxHealth/price.text = "15" + " Points"
				timesBoughtBossfightmaxhealth += 1
		elif timesBoughtBossfightmaxhealth == 2:
			if Global.points >= 15: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 15
				Global.bossfightMaxHealth = 250
				$bossfightMaxHealth/upgradeDisplay.text = "250 health"
				$bossfightMaxHealth/price.text = "20" + " Points"
				timesBoughtBossfightmaxhealth += 1
		elif timesBoughtBossfightmaxhealth == 3:
			if Global.points >= 20: # SET THE PRICE ON THIS LINE AND THE NEXT LINE --------------------------------------------
				Global.points -= 20
				Global.bossfightMaxHealth = 300
				$bossfightMaxHealth/upgradeDisplay.text = "300 health"
				$bossfightMaxHealth/price.visible = false
				$bossfightMaxHealth.input_pickable = false
				var shop_sold = shop_sold_scene.instantiate()
				shop_sold.position = Vector2(532,530)
				shop_sold.scale = Vector2(0.75,0.75)
				shop_sold.rotation_degrees = randi_range(-20,20)
				add_child(shop_sold)
				timesBoughtBossfightmaxhealth += 1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingNextround and mouseReleased:
		Global.level += 1
		Global.roundStart.emit()
		visible = false
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouseTouchingRestart and mouseReleased:
		if timesClickedRestart == 1:
			get_tree().reload_current_scene()
		else:
			restart_pressed()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)  and mouseReleased:
		mouseReleased = false

func restart_pressed():
	timesClickedRestart += 1
	$restart/button.visible = false
	$restart/confirmButton.visible = true
	$restart/Label.visible = true
	$restart/Label.text = "3"
	await get_tree().create_timer(1).timeout
	$restart/Label.text = "2"
	await get_tree().create_timer(1).timeout
	$restart/Label.text = "1"
	await get_tree().create_timer(1).timeout
	$restart/button.visible = true
	$restart/confirmButton.visible = false
	$restart/Label.visible = false
	timesClickedRestart = 0

func _on_double_jump_mouse_entered() -> void:
	$doubleJump/Sprite2D.modulate = Color(0.7,0.7,0.7,1)
	mouseTouchingDoublejump = true
func _on_double_jump_mouse_exited() -> void:
	$doubleJump/Sprite2D.modulate = Color(1,1,1,1)
	mouseTouchingDoublejump = false

func _on_slam_mouse_entered() -> void:
	$slam/Sprite2D.modulate = Color(0.7,0.7,0.7,1)
	mouseTouchingSlam = true
func _on_slam_mouse_exited() -> void:
	$slam/Sprite2D.modulate = Color(1,1,1,1)
	mouseTouchingSlam = false

func _on_freeze_mouse_entered() -> void:
	$freeze/Sprite2D.modulate = Color(0.7,0.7,0.7,1)
	mouseTouchingFreeze = true
func _on_freeze_mouse_exited() -> void:
	$freeze/Sprite2D.modulate = Color(1,1,1,1)
	mouseTouchingFreeze = false

func _on_regen_mouse_entered() -> void:
	$regen/Sprite2D.modulate = Color(0.7,0.7,0.7,1)
	mouseTouchingRegen = true
func _on_regen_mouse_exited() -> void:
	$regen/Sprite2D.modulate = Color(1,1,1,1)
	mouseTouchingRegen = false

func _on_coin_spawn_rate_mouse_entered() -> void:
	$coinSpawnRate/Sprite2D.modulate = Color(0.7,0.7,0.7,1)
	mouseTouchingCoinspawnrate = true
func _on_coin_spawn_rate_mouse_exited() -> void:
	$coinSpawnRate/Sprite2D.modulate = Color(1,1,1,1)
	mouseTouchingCoinspawnrate = false

func _on_gold_coin_chance_mouse_entered() -> void:
	$goldCoinChance/Sprite2D.modulate = Color(0.7,0.7,0.7,1)
	mouseTouchingGoldcoinchance = true
func _on_gold_coin_chance_mouse_exited() -> void:
	$goldCoinChance/Sprite2D.modulate = Color(1,1,1,1)
	mouseTouchingGoldcoinchance = false

func _on_freeze_duration_mouse_entered() -> void:
	$freezeDuration/Sprite2D.modulate = Color(0.7,0.7,0.7,1)
	mouseTouchingFreezeduration = true
func _on_freeze_duration_mouse_exited() -> void:
	$freezeDuration/Sprite2D.modulate = Color(1,1,1,1)
	mouseTouchingFreezeduration = false

func _on_bossfight_max_health_mouse_entered() -> void:
	$bossfightMaxHealth/Sprite2D.modulate = Color(0.7,0.7,0.7,1)
	mouseTouchingBossfightmaxhealth = true
func _on_bossfight_max_health_mouse_exited() -> void:
	$bossfightMaxHealth/Sprite2D.modulate = Color(1,1,1,1)
	mouseTouchingBossfightmaxhealth = false

func _on_next_round_mouse_entered() -> void:
	$nextRound/Sprite2D.modulate = Color(0.7,0.7,0.7,1)
	mouseTouchingNextround = true
func _on_next_round_mouse_exited() -> void:
	$nextRound/Sprite2D.modulate = Color(1,1,1,1)
	mouseTouchingNextround = false

func _on_restart_mouse_entered() -> void:
	$restart.modulate = Color(0.7,0.7,0.7,1)
	mouseTouchingRestart = true
func _on_restart_mouse_exited() -> void:
	$restart.modulate = Color(1,1,1,1)
	mouseTouchingRestart = false
