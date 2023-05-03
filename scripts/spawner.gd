extends StaticBody2D

@export var tier =1
@export var max_health = 100

var current_health = 100:set=_set_health
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _set_health(new_hp): 
	current_health = new_hp 
	if current_health <= 0: 
		die()
func die(): 
	queue_free()

func _process(delta):
	pass
	
func receive_hit(hitbox:Hitbox): 
	current_health -= hitbox.damage
	hitbox.damage_dealt()

func spawn_mob(): 
	match tier: 
		1:
			var mobs = Global.T1_MOBS	
			var mob = mobs[Global.rand_int(mobs.size())].instantiate()
			mob.position = $Marker2D.position
			add_child(mob)
func _on_spawn_rate_timeout():
	spawn_mob()
