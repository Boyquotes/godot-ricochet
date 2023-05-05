extends Area2D
class_name Hurtbox

var max_health = 0
var current_health = 0:set=_set_health

func _ready(): 
	max_health=owner.max_health
	current_health = max_health
	self.connect("area_entered",Callable(self,"_on_area_entered"))

func _on_area_entered(hitbox: Hitbox):
	if hitbox == null or !hitbox.can_dmg:
		return
	if owner.has_method("receive_hit"):
		owner.receive_hit(hitbox)
		
func _set_health(new_hp): 
	current_health = new_hp 
	print(owner.name + " health:"+str(current_health))
	if current_health <= 0: 
#		die()
		if owner.has_method("out_of_health"): 
			owner.out_of_health()
		pass
		
