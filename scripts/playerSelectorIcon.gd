extends Area2D

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
