extends Node

export (PackedScene) var turret_scene

func _physics_process(delta):
	var visible_rect:Rect2 = get_viewport().get_visible_rect()
	#print(visible_rect)


func initialize(player):
	var visible_rect:Rect2 = get_viewport().get_visible_rect()
	for i in 50:
		var turret_instance = turret_scene.instance()
		
		var turret_pos:Vector2 = Vector2(rand_range(0, 9000), rand_range(0, 256))
		turret_instance.initialize(self, turret_pos, player, self)
		#print(turret_pos)
