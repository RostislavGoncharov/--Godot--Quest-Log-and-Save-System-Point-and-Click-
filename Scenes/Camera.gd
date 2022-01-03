extends Camera2D

func _ready():
	$FadeLayer/TextureRect/AnimationPlayer.play("fade_in")
