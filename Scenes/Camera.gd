extends Camera2D

func _ready():
	fade_in()
	
func fade_in():
	$FadeLayer/TextureRect/AnimationPlayer.play("fade_in")

func fade_out():
	$FadeLayer/TextureRect/AnimationPlayer.play_backwards("fade_in")