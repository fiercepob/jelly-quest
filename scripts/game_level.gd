extends Node2D

var point_scene = preload("res://point.tscn")

var fourPointChance = 0.25
var pointType = "1"

func _ready():
	Global.roundEnd.connect(round_end)
	while true:
		await get_tree().create_timer(Global.pointSpawnRate).timeout
		spawn_point()

func spawn_point():
	var point = point_scene.instantiate()
	if Global.level == 1:
		point.position = Vector2(randi_range(35,1115),randi_range(200,480))
	else:
		point.position = Vector2(randi_range(35,1115),randi_range(40,480))
	add_child(point)

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
