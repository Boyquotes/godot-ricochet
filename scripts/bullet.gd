extends CharacterBody2D
class_name Bullet

@export var SPEED =200
@export var ricochey = 100 # number of times bulet can ricochet
@export var damage = 30

var rich_counts = 0:set = _set_rich
var released = false

func _set_rich(new_rich): 
	rich_counts = new_rich
	if rich_counts == ricochey: 
		$Hitbox.can_dmg = true 
		
var veloc = Vector2.ZERO
func _ready():
	if released:
		set_as_top_level(true)

func _physics_process(delta):
	_motion(delta)
	pass 
	
func _motion(delta): 
	var collision = move_and_collide(veloc*delta)
	if collision: 
		if  rich_counts < ricochey: 
			veloc = veloc.bounce(collision.get_normal())
			look_at(global_position+veloc)
			rich_counts+=1
		else: 
			queue_free()

func _damage_dealt(): 
	queue_free()
func set_veloc(dir:Vector2): 
	dir = dir.normalized()
	veloc = dir * SPEED
	look_at(self.global_position+dir)  

