extends Node2D

func _ready():
	Global.freezeCooldownTimer = 0
	Global.slamCooldownTimer = 0
	Global.roundEnd.connect(round_end)

func round_end():
	await get_tree().create_timer(1).timeout
	Global.time = 0
	queue_free()

func _process(delta):
	Global.time += delta
	if Global.slamCooldownTimer > -1:
		Global.slamCooldownTimer -= delta
	if Global.freezeCooldownTimer > -1:
		Global.freezeCooldownTimer -= delta
