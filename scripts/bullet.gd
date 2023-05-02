extends CharacterBody2D
class_name Bullet

const SPEED =20.0
var veloc = Vector2()
func _ready():
	set_as_top_level(true)
	

func _physics_process(delta):
	var collision = move_and_collide(veloc)
	if collision: 
		veloc = veloc.bounce(collision.get_normal())
	
func set_veloc(dir:Vector2): 
	dir = dir.normalized()
	veloc = dir * SPEED

