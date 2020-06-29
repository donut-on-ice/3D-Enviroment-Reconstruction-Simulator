extends Spatial



func _on_Sprite_position_changed(node, new_pos):
		print("The position of " + node.name + " is now " + str(new_pos))




export(float) var mouse_sens := 0.3
export(float) var camera_speed := 10.0
var camera_anglev := 0

var is_paused := false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 
	is_paused = false


func _physics_process(delta):
	var move_dir = Vector3(
		Input.get_action_strength("camera_forward") - Input.get_action_strength("camera_backward"),
		Input.get_action_strength("camera_up") - Input.get_action_strength("camera_down"),
		Input.get_action_strength("camera_left") - Input.get_action_strength("camera_left")
	)
	
	$Camera.translate(move_dir * camera_speed * delta)


func _input(event):         
	
	if Input.is_key_pressed(KEY_TAB):
		
		if is_paused:
		
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			is_paused = false
		
		else:
			
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			is_paused = true
	
	
	if event is InputEventMouseMotion and !is_paused:
	
		$Camera.rotate_y(deg2rad(-event.relative.x*mouse_sens))
		var changev=-event.relative.y*mouse_sens
	
		if camera_anglev+changev>-50 and camera_anglev+changev<50:
	
			camera_anglev+=changev
			$Camera.rotate_x(deg2rad(changev))
