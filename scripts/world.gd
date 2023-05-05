extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.y_sort_enabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"): 
		$"zel-boy"/Camera2D.shake(5.0)
