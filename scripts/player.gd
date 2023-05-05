extends CharacterBody2D

@onready var anim_p = $AnimationPlayer
const SPEED = 300.0
var weapon = null

func _ready():
	equip_weapon(Global.WEAPONS["Bow"])
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
func equip_weapon(WeaponScene: PackedScene): 
	var weap = WeaponScene.instantiate()
	weap.position = $weapon_pos.position
	weapon = weap
	add_child(weapon)
func _physics_process(delta):
	var x_dir = Input.get_axis("ui_left", "ui_right")
	var y_dir = Input.get_axis("ui_up", "ui_down")
	
	if x_dir || y_dir:
		velocity= Vector2(x_dir,y_dir) * SPEED
		flip_sprite(x_dir)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if velocity != Vector2.ZERO: 
		anim_p.play("walk")
	else: 
		anim_p.play("idle")
	move_and_slide()
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			weapon.hold()
		else:
			weapon.shoot()

	
