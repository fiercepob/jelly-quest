extends Node

signal roundStart
signal roundEnd
signal gameEnd

var level = 0
var points = 0
var gameRunning = false
var canRegen = false
var playerSprite = 0
var time = 0
var warningHeatInterval = 0

var pointSpawnRate = 0
var goldPointChance = 0
var freezeDuration = 0
var bossfightMaxHealth = 0

var canDoubleJump = false
var canSlam = false
var canFreeze = false
var freezeTimer = 0.0
var playerFrozen = false
var canDieFromWave = false
var canDieFromFloatingBall = false

var freezeCooldown = 0
var slamCooldown = 0
var freezeCooldownTimer = 0.0
var slamCooldownTimer = 0.0

func reload_game():
	level = 1
	points = 0
	gameRunning = false
	canRegen = false
	playerSprite = 1
	time = 0
	warningHeatInterval = 0.7

	pointSpawnRate = 2
	goldPointChance = 0
	freezeDuration = 1
	bossfightMaxHealth = 100

	canDoubleJump = false
	canSlam = false
	canFreeze = false
	freezeTimer = 0.0
	playerFrozen = false
	canDieFromWave = false
	canDieFromFloatingBall = false
	
	freezeCooldown = 3
	slamCooldown = 3
	freezeCooldownTimer = 0.0
	slamCooldownTimer = 0.0
