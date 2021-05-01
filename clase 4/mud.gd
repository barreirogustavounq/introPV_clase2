extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_mud_body_entered(body):
	if body.has_method("in_the_mud"):
		body.in_the_mud()


func _on_mud_body_exited(body):
	if body.has_method("out_the_mud"):
		body.out_the_mud()
	
