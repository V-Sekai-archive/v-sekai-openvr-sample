extends Node3D

func _process(delta):
	if (Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
	elif (Input.is_key_pressed(KEY_SPACE)):
		# Reset our reference frame.
		# Calling center_on_hmd will cause the ARVRServer to adjust all tracking data so the player is centered on the origin point looking forward.
		XRServer.center_on_hmd(true, true)

func _ready():
	pass

func _on_Right_Hand_action_pressed(action):
	print("Action pressed " + action)
	$Player/Right_Hand.trigger_haptic("/actions/godot/out/haptic", 1.0, 4.0, 1.0)
