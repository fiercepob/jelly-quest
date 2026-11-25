extends Node2D

var point_scene = preload("res://point.tscn")
var waves_scene = preload("res://waves.tscn")

var waveSpawnInterval = 0

func _ready():
	ready_two()
	Global.freezeCooldownTimer = 0
	Global.slamCooldownTimer = 0
	Global.roundEnd.connect(round_end)
	while true:
		await get_tree().create_timer(Global.pointSpawnRate).timeout
		spawn_point()
func ready_two():
	if Global.level == 1:
		waveSpawnInterval = 23
	elif Global.level == 2:
		waveSpawnInterval = 7
	elif Global.level > 2 and Global.level < 7:
		waveSpawnInterval = 5
	else:
		waveSpawnInterval = 4
	
	while true:
		await get_tree().create_timer(waveSpawnInterval).timeout
		spawn_wave()

func spawn_point():
	var point = point_scene.instantiate()
	if Global.level == 1:
		point.position = Vector2(randi_range(35,1115),randi_range(200,480))
	else:
		point.position = Vector2(randi_range(35,1115),randi_range(40,480))
	add_child(point)

func spawn_wave():
	var wave = waves_scene.instantiate()
	var i = $Lasers.get_index()
	add_child(wave)
	move_child(wave, i)
	wave.body_entered.connect($Player._on_waves_body_entered)

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
