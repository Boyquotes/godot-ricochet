extends Enemy

@export var damage = 30
@export var speed = 50
@export var leap_factor = 10000
@onready var anim_p = $AnimationPlayer
@onready var RedDemonScene = preload("res://scenes/enemies/red-demon.tscn")
var attacktime = 10
var patrol = false
var patrol_pos = Vector2.ZERO
var patrol_veloc
const TOLERANCE = 4.0

func _ready(): 
	pass
	
func _physics_process(delta):
	if patrol: 
		velocity=patrol_veloc
		if is_at_target_pos(): 
			$patrol_timer.paused=false
			patrol = false
	else:
		velocity=Vector2.ZERO
		anim_p.play("idle")	
		
	move_and_slide()
	pass

func _motion():

	pass 
func attack(dir,delta): 
	anim_p.play("attack")
	velocity = dir * leap_factor*delta
	
	
func is_at_target_pos(): 
	if patrol_pos.distance_to(global_position) < TOLERANCE: 
		return true
	return false

func _on_patrol_timer_timeout():
	patrol_pos = to_global(Global.rand_point_in_circle($PatrolZone/CollisionShape2D.shape.radius))
	patrol_veloc = self.global_position.direction_to(patrol_pos)*speed
	$patrol_timer.paused= true
	patrol = true
	
	pass # Replace with function body.

