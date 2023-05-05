extends Line2D

@export var MAX_POINTS =50
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_veloc(_veloc): 
	$GhostBody.veloc = _veloc 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func draw_traject(delta): 
	for i in MAX_POINTS: 
		add_point($GhostBody.position)
		$GhostBody._motion(delta)
		
