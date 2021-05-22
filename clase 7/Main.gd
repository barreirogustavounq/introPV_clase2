extends Node

onready var player = $Environment/Player
onready var GUI = $GUI
onready var background_audio = $Background
onready var ambience_audio = $Ambience
onready var audio = $AudioStreamPlayer2D


func _ready():
	randomize()
	player.initialize(self)

func _unhandled_input(event):
	if event.is_action("restart"):
		_restart_level()

func _restart_level():
	get_tree().reload_current_scene()

func pause_audio():
	background_audio.playing = false
	ambience_audio.playing = false
	audio.playing = false
