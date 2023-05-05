extends CharacterBody2D
@export var veloc = Vector2.ZERO
@onready var arrowshape = preload("res://collision_shape_2d.tscn")
func _ready():
	var _arrowshape = arrowshape.instantiate()
	add_child(_arrowshape)



func _motion(delta): 
	var collision = move_and_collide(veloc*delta,false,true,true)
	if collision: 
		veloc = veloc.bounce(collision.get_normal())
		look_at(global_position+veloc)
