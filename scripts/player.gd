extends CharacterBody2D

var jumps = 0
var canSlam = false
var insideGround = false
var xVel = 0
var yVel = 0
var drag = 0.96
var gravity = 0.5

var playerSpeed = 0.6
var bounceStrength = 16.5
var wallBounceStrength = 20
var jumpStrength = 14
var slamStrength = 50
var releasedJump = true
var releasedSlam = true
var hasPressedFreeze = false

func _physics_process(delta):
	yVel += gravity
	if Input.is_key_pressed(KEY_A):
		xVel -= playerSpeed
	if Input.is_key_pressed(KEY_D):
		xVel += playerSpeed
	if Input.is_key_pressed(KEY_W) and jumps < 1 and releasedJump and Global.canDoubleJump:
		yVel = jumpStrength * -1
		jumps += 1
		releasedJump = false
	if Input.is_key_pressed(KEY_S) and canSlam and releasedSlam and Global.canSlam and Global.slamCooldownTimer < 0:
		yVel = slamStrength
		canSlam = false
		releasedSlam = false
		Global.slamCooldownTimer = Global.slamCooldown
	if Input.is_key_pressed(KEY_E) and Global.canFreeze and not insideGround and Global.freezeCooldownTimer < 0:
		if Global.freezeTimer > 0:
			Global.playerFrozen = true
			Global.freezeTimer -= delta
			xVel = 0
			yVel = 0
			hasPressedFreeze = true
		else:
			Global.playerFrozen = false
			Global.freezeCooldownTimer = Global.freezeCooldown
	if not Input.is_key_pressed(KEY_W):
		releasedJump = true
	if not Input.is_key_pressed(KEY_S):
		releasedSlam = true
	if not Input.is_key_pressed(KEY_E):
		Global.freezeTimer = Global.freezeDuration
		Global.playerFrozen = false
		if hasPressedFreeze and Global.freezeCooldownTimer < 0:
			Global.freezeCooldownTimer = Global.freezeCooldown
			hasPressedFreeze = false
		
	xVel *= drag 
	
	var velocity = Vector2(xVel,yVel)
	rotation += xVel * 0.02
	position += velocity
	
func _on_trampoline_body_entered(body: Node2D) -> void:
	yVel = bounceStrength * -1
	insideGround = true
func _on_trampoline_body_exited(body: Node2D) -> void:
	insideGround = false
	canSlam = true
	jumps = 0
func _on_left_wall_body_entered(body: Node2D) -> void:
	xVel = wallBounceStrength
	insideGround = true
func _on_left_wall_body_exited(body: Node2D) -> void:
	insideGround = false
func _on_right_wall_body_entered(body: Node2D) -> void:
	xVel = wallBounceStrength * -1
	insideGround = true
func _on_right_wall_body_exited(body: Node2D) -> void:
	insideGround = false
func _on_lasers_body_entered(body: Node2D) -> void:
	if $"../Lasers/laser".visible:
		set_physics_process(false)
		Global.roundEnd.emit()
		var i = 1.0
		while i >= 0:
			await get_tree().create_timer(0.05).timeout
			modulate = Color(1,1,1,i)
			i -= 0.1
func _on_waves_body_entered(body: Node2D) -> void:
	set_physics_process(false)
	Global.roundEnd.emit()
	var i = 1.0
	while i >= 0:
		await get_tree().create_timer(0.05).timeout
		modulate = Color(1,1,1,i)
		i -= 0.1

func _process(delta):
	if Global.playerSprite == 1:
		$player1.visible = true
		$player2.visible = false
		$player3.visible = false
		$player4.visible = false
		$player5.visible = false
	elif Global.playerSprite == 2:
		$player1.visible = false
		$player2.visible = true
		$player3.visible = false
		$player4.visible = false
		$player5.visible = false
	elif Global.playerSprite == 3:
		$player1.visible = false
		$player2.visible = false
		$player3.visible = true
		$player4.visible = false
		$player5.visible = false
	elif Global.playerSprite == 4:
		$player1.visible = false
		$player2.visible = false
		$player3.visible = false
		$player4.visible = true
		$player5.visible = false
	elif Global.playerSprite == 5:
		$player1.visible = false
		$player2.visible = false
		$player3.visible = false
		$player4.visible = false
		$player5.visible = true
