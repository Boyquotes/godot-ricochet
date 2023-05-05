extends Camera2D

var shake_magnitude = 0.0

func _ready():
	pass

func shake(magnitude):
	shake_magnitude = magnitude
	var duration = 0.2
	var distance = Vector2(magnitude, 0)
	var tween = create_tween()
	tween.interpolate_property(self, "position", position, position + distance, duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property(self, "position", position + distance, position, duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

func _process(delta):
	if shake_magnitude > 0:
		shake_magnitude -= delta * 5
		if shake_magnitude < 0:
			shake_magnitude = 0
