extends CharacterBody2D

@onready var BulletScene = preload("res://scenes/bullet.tscn")
const SPEED = 300.0


func _physics_process(delta):
	var x_dir = Input.get_axis("ui_left", "ui_right")
	var y_dir = Input.get_axis("ui_up", "ui_down")
	
	if x_dir || y_dir:
		velocity= Vector2(x_dir,y_dir) * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if Input.is_action_just_released("ui_accept"):
		shoot()
	move_and_slide()

func shoot():
	var bullet:Bullet = BulletScene.instantiate() 
	bullet.global_position = $shoot_pos.global_position
	
	var shoot_dir = bullet.global_position.direction_to(get_global_mouse_position())
	bullet.set_veloc(shoot_dir)
	add_child(bullet)
	
