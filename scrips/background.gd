extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $"..".you_lost:
		$ParallaxMontañas.motion_offset.x -= 1
		$ParallaxCielo.motion_offset.x -= 1.5
		$ParallaxLayer.motion_offset.x -= 2
