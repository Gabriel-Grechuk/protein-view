# A simple First Person Player setup.
extends CharacterBody3D


const MOVE_SPEED = 7.0
const JUMP_SPEED = 6
const MOUSE_SENSIVITY = 0.005
const MIN_CAM_ANGLE = -90.0
const MAX_CAM_ANGLE = 90.0
const GRAVITY = 15


@onready var neck := $Neck
@onready var camera := $Neck/Camera3D


# Handle mouse input.
func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif event.is_action_pressed('ui_cancel'):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * MOUSE_SENSIVITY)
			camera.rotate_x(-event.relative.y * MOUSE_SENSIVITY)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(MIN_CAM_ANGLE), deg_to_rad(MAX_CAM_ANGLE))


# Regular first person player input.
func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	# I'm not sure if the viewer will be able to jump, but i'm keeping it for now.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED

	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * MOVE_SPEED
		velocity.z = direction.z * MOVE_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, MOVE_SPEED)
		velocity.z = move_toward(velocity.z, 0, MOVE_SPEED)

	move_and_slide()
