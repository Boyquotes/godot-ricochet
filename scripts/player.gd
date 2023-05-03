extends CharacterBody2D

@onready var BulletScene = preload("res://scenes/bullet.tscn")
@onready var anim_p = $AnimationPlayer
const SPEED = 300.0

func flip_sprite(x_dir): 
	var isRight =true
	if x_dir < 0: 
		isRight = false
	else: 
		isRight = true 
		
	if isRight: 
		$Sprite2D.flip_h = false
	else: 
		$Sprite2D.flip_h = true

func _physics_process(delta):
	var x_dir = Input.get_axis("ui_left", "ui_right")
	var y_dir = Input.get_axis("ui_up", "ui_down")
	
	if x_dir || y_dir:
		velocity= Vector2(x_dir,y_dir) * SPEED
		flip_sprite(x_dir)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if Input.is_action_just_released("ui_accept"):
		shoot()
	if velocity != Vector2.ZERO: 
		anim_p.play("walk")
	else: 
		anim_p.play("idle")
	move_and_slide()

func shoot():
	var bullet:Bullet = BulletScene.instantiate() 
	bullet.global_position = $shoot_pos.global_position
	
	var shoot_dir = bullet.global_position.direction_to(get_global_mouse_position())
	bullet.set_veloc(shoot_dir)
	add_child(bullet)
	
