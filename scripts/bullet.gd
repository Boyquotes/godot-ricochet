extends CharacterBody2D
class_name Bullet

@export var SPEED =20.0
@export var ricochey = 2 # number of times bulet can ricochet
@export var damage = 30

var rich_counts = 0:set = _set_rich
func _set_rich(new_rich): 
	rich_counts = new_rich
	if rich_counts == ricochey: 
		$Hitbox.can_dmg = true 
		
var veloc = Vector2()
func _ready():
	set_as_top_level(true)
	

func _physics_process(delta):
	var collision = move_and_collide(veloc)
	if collision: 
		if  rich_counts < ricochey: 
			veloc = veloc.bounce(collision.get_normal())
			rich_counts+=1
		else: 
			queue_free()
	
	
func set_veloc(dir:Vector2): 
	dir = dir.normalized()
	veloc = dir * SPEED

