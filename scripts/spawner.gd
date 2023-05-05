extends StaticBody2D

@export var tier =1
@export var max_health = 100
@onready var spawn_zone = $spawn_area/spawn_zone
@onready var nospawn_zone = $spawn_area/nospawn_zone
@onready var spawntest= $spawn_test

var spawnable = true
var spawn_point = null
var potential_mob = null
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_point = generate_spawn_point()
	pass

func die(): 
	queue_free()

func _process(delta):
	pass
	
func receive_hit(hitbox:Hitbox): 
	$Hurtbox.current_health -= hitbox.damage
	hitbox.damage_dealt()
func ran_neg(): 
	var r = Global.rand_int(2)
	if r == 0: 
		return -1 
	else:
		return 1
func generate_spawn_point(): 
	var x = ran_neg() * Global.rand_float(spawn_zone.shape.radius*2)
	var y = ran_neg() * Global.rand_float(spawn_zone.shape.radius*2)

	var result=spawn_zone.global_position+Vector2(x,y)
	

	if nospawn_zone.global_position.distance_to(result) > nospawn_zone.shape.radius:
		return result
	else: 
		return generate_spawn_point()

func move_point_randomly(): 
	spawntest.global_position = generate_spawn_point() 
		
func choose_mob(): 
	match tier: 
		1:
			var mobs = Global.T1_MOBS	
			var mob =  mobs[Global.rand_int(mobs.size())].instantiate()
			return mob 			
			
func spawn_mob(): 
	if potential_mob == null: 
		return 
	potential_mob.global_position = spawntest.global_position
	get_tree().get_root().add_child(potential_mob)
			
func get_overlaps(): 
	return get_tree().get_nodes_in_group(self.name+ " overlapped")

func _physics_process(delta):
	if spawntest.get_overlapping_bodies().size()==0:	
		spawnable = true
	else: 
		spawnable=false
		move_point_randomly() 
		
func _on_spawn_rate_timeout():
	if spawnable: 
		potential_mob = choose_mob()
		spawntest.get_node("CollisionShape2D").shape = potential_mob.get_node("CollisionShape2D").shape
		spawn_mob()
		spawnable=false
		move_point_randomly()

#func _on_spawn_test_body_entered(body):
#	if body == null: 
#		return 
#	body.add_to_group(self.name+" overlapped")
#
#func _on_spawn_test_body_exited(body):
#	if body == null: 
#		return
#	body.remove_from_group(self.name+" overlapped")
#
#	if get_tree().get_nodes_in_group(self.name+ " overlapped").size() == 0:
#		spawn_mob()
#		spawnable = true
#
#	move_point_randomly()
#	pass # Replace with function body.
