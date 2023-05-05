extends Node
const MOUSE_SENSITVITY = 0.8
const T1_MOBS = [ 
	preload("res://scenes/enemies/red-demon.tscn")
]
var rng = RandomNumberGenerator.new()
const WEAPONS = {
	"Bow":	preload("res://scenes/weapons/bow.tscn")

}
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	pass # Replace with function body.

func ran_neg(): 
	var r = Global.rand_int(2)
	if r == 0: 
		return -1 
	else:
		return 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func rand_float(r): 
	return rng.randf() * r
func rand_int(r): 
	return rng.randi() % r
func get_mouse_pos(): 
	pass
func rand_point_in_circle(radius): 
	var x = ran_neg() * rand_float(radius)
	var y = ran_neg() * sqrt(radius*radius-x*x)
	return Vector2(x,y)
