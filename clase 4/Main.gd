extends Node

onready var player = $Player
onready var turret_spawner = $TurretsSpawner

func _ready():
	randomize()
	player.initialize(self)
	turret_spawner.initialize(player)


func _on_trampolin_body_entered(body):
	if body.has_method("jump"):
		body.jump()
