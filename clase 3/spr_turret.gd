extends Sprite

onready var fire_position = $fire_position_turret

var projectile_scene: PackedScene = load("res://entities/Proyectile.tscn")


func fire():
	var player = get_parent().get_parent().get_parent().get_node("Player")
	var new_projectile = projectile_scene.instance()
	get_parent().get_parent().add_child(new_projectile)
	new_projectile.initialize((player.global_position - global_position).normalized(), fire_position.global_position)


func _on_fire_timer_timeout():
	fire() # Replace with function body.
