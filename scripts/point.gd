extends Node2D

func _ready():
	Global.roundEnd.connect(round_end)
	var i = randf()
	
	if i < Global.goldPointChance:
		$"1Point".visible = false
		$"4Point".visible = true
		$"1Point".monitoring = false
		$"4Point".monitoring = true
	else:
		$"1Point".visible = true
		$"4Point".visible = false
		$"1Point".monitoring = true
		$"4Point".monitoring = false

func round_end():
	queue_free()
