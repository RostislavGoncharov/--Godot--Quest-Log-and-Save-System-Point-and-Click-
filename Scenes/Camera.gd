extends Camera2D

func _ready():
	fade_in()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene()
		Player.get_node("Camera").fade_in()
	
func fade_in():
	$FadeLayer/TextureRect/AnimationPlayer.play("fade_in")

func fade_out():
	$FadeLayer/TextureRect/AnimationPlayer.play_backwards("fade_in")
