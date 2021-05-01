extends KinematicBody2D

onready var cannon = $Cannon
onready var camera = $Camera2D

export (float) var ACCELERATION:float = 20.0
export (float) var H_SPEED_LIMIT:float = 600.0
export (float) var FRICTION_WEIGHT:float = 0.1
export (float) var JUMP_POWER : float = 200
export (float) var GRAVITY: float = 10

var velocity:Vector2 = Vector2.ZERO
var projectile_container

func initialize(projectile_container):
	self.projectile_container = projectile_container
	cannon.projectile_container = projectile_container

func _physics_process(delta):
	
	# Cannon rotation
	var mouse_position:Vector2 = get_global_mouse_position()
	cannon.look_at(mouse_position)
	

	
	# Cannon fire
	if Input.is_action_just_pressed("fire_cannon"):
		if projectile_container == null:
			projectile_container = get_parent()
			cannon.projectile_container = projectile_container
		cannon.fire()
	
	#if Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
		#if is_on_floor():
			#camera.current=true
	
	# Player movement
	var h_movement_direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if h_movement_direction != 0:
		velocity.x = clamp(velocity.x + (h_movement_direction * ACCELERATION), -H_SPEED_LIMIT, H_SPEED_LIMIT)
	else:
		velocity.x = lerp(velocity.x, 0, FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0
	
	position.y += GRAVITY
	
	#position += velocity * delta
	move_and_slide(velocity) 
	#move_and_slide(Vector2(0, position.y))
	
	move_and_slide(Vector2.DOWN, Vector2(0,-1))
	#jump
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			#camera.current = false
			position.y -= JUMP_POWER

	
func notify_hit():
	print("me pego")

func jumpTrampolin():
	position.y -= JUMP_POWER * 2
	
func in_the_mud():
	ACCELERATION = 2

func out_the_mud():
	ACCELERATION = 20
