extends Sprite2D

func _ready():
	Global.roundEnd.connect(on_round_end)

func _process(delta):
	position = $"../Player".position + Vector2(0,-45)
	if Global.playerFrozen == true:
		visible = true
		if Global.freezeDuration < 20:
			$Label.visible = true
			$Label.text = str(snapped(Global.freezeTimer,0.1))
		else:
			$Label.visible = false
	else:
		visible = false

func on_round_end():
	set_process(false)
	visible = false
