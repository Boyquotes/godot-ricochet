extends Node2D
class_name Weapon

@onready var TrajectScene = preload("res://trajectory.tscn")
@export var BulletScene:PackedScene
var holding_bullet = null 
var aim_pos=Vector2.ZERO
var _new_pos=Vector2.ZERO

func _ready():
	pass
func _process(delta):
	look_at(get_global_mouse_position())

func _physics_process(delta):
	if holding_bullet: 
		aim_pos=get_global_mouse_position()
		if !has_node("./Trajectory"):
			var traject = TrajectScene.instantiate()
			traject.position = $shoot_pos.position
			var shoot_dir = holding_bullet.global_position.direction_to(get_global_mouse_position())
			traject.set_veloc(holding_bullet.SPEED*shoot_dir)
			add_child(traject)
			$Trajectory.draw_traject(delta)
		elif _new_pos != aim_pos: 
			$Trajectory.queue_free() 
	elif has_node("./Trajectory"): 
		$Trajectory.queue_free()
	_new_pos = aim_pos
		

			

func shoot(): 
	if !holding_bullet: 
		return
	var shoot_dir = holding_bullet.global_position.direction_to(get_global_mouse_position())
	holding_bullet.set_as_top_level(true)
	holding_bullet.set_veloc(shoot_dir)
	holding_bullet.global_position = $shoot_pos.global_position
	holding_bullet.get_node("CollisionShape2D").disabled=false
	$Sprite2D.frame=0		
	holding_bullet=null
	
		
		
func hold():
	var bullet:Bullet = BulletScene.instantiate() 
	bullet.position =  $shoot_pos.position
	holding_bullet = bullet
	bullet.get_node("CollisionShape2D").disabled=true
	add_child(bullet)
	$Sprite2D.frame=1
	
