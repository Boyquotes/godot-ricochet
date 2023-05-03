extends Area2D


func _ready(): 
	self.connect("area_entered",Callable(self,"_on_area_entered"))

func _on_area_entered(hitbox: Hitbox):
	if hitbox == null or !hitbox.can_dmg:
		return
	if owner.has_method("receive_hit"):
		owner.receive_hit(hitbox)

