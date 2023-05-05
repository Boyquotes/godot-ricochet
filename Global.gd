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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func rand_float(r): 
	return rng.randf() * r
func rand_int(r): 
	return rng.randi() % r
func get_mouse_pos(): 
	pass
