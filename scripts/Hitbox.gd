extends Area2D
class_name Hitbox
@onready var damage = owner.damage
@export var can_dmg = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func damage_dealt(): 
	owner.queue_free()
