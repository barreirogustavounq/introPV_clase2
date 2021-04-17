extends Sprite

export (float) var speed: float = 40

func _physics_process(delta):
	var right: bool = Input.is_action_pressed("derecha")
	var left: bool = Input.is_action_pressed("izquierda")

	if right:
		position.x += speed * delta
	elif left:
		position.x -= speed * delta


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
