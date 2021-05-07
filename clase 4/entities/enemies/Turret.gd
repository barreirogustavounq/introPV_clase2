extends Area2D

onready var fire_position = $FirePosition
onready var fire_timer = $FireTimer

export (PackedScene) var projectile_scene

var player
var projectile_container

func _physics_process(delta):
	if get_node("RayCast2D").is_colliding():
		var body = get_node("RayCast2D").get_collider()
		if(body.is_in_group("player")):
			fire_timer.start()
			print("AL ATAQUE")
	if get_node("RC_noAttack").is_colliding():
		var body = get_node("RC_noAttack").get_collider()
		if(body.is_in_group("player")):
			fire_timer.stop()
			print("DEJAR DE ATACAR")
			
func initialize(container, turret_pos, player, projectile_container):
	container.add_child(self)
	global_position = turret_pos
	self.player = player
	self.projectile_container = projectile_container
	fire_timer.connect("timeout", self, "fire_at_player")
#	fire_timer.start()

func fire_at_player():
	var proj_instance = projectile_scene.instance()
	proj_instance.initialize(projectile_container, fire_position.global_position, fire_position.global_position.direction_to(player.global_position))

func _on_Area2D_body_entered(body):
	if body.has_method("notify_hit"):
		print("esta cerca")
		fire_timer.start()


func _on_Area2D_body_exited(body):
	if body.has_method("notify_hit"):
		print("esta lejos")
		fire_timer.stop()

func notify_hit():
	queue_free()
	print("le pegue a la torreta")
