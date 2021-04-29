extends KinematicBody2D
#var arm

onready var arm = $Arm

export var speed = 300 #Pixeles
export var acceleration = 0


#const projectile_scene: PackedScene = load('res://entities/player/PlayerProyectile.tscn')
func initialize(projectile_container):
	arm.container = projectile_container

#func _ready():
#	arm = $Mano

func _physics_process(delta):
	# Manera básica
	#var direction:int = 0
	#if Input.is_action_pressed("move_left"):
	#	direction = -1
	#elif Input.is_action_pressed("move_right"):
	#	direction = 1
	
	#position.x += direction * speed * delta
	
	var mouse_position:Vector2= get_local_mouse_position()
	arm.rotation = mouse_position.normalized().angle()
	
	if Input.is_action_just_pressed("fire"):
		arm.fire()
		print(self.global_position)

	# Manera optimizada
	if Input.is_action_pressed("move_right"):  
		acceleration+= 1
		print(acceleration)
		var mySpeed = (speed * delta ) + (acceleration * delta)
		var movement : Vector2 = Vector2(mySpeed, 0)
		move_and_collide(movement)
	elif Input.is_action_pressed("move_left"):
		acceleration-= 1
		print(acceleration)
		var mySpeed = (speed * delta ) - (acceleration * delta)
		var movement : Vector2 = Vector2(-mySpeed, 0)
		move_and_collide(movement)
		

