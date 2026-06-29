extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var has_double_jump = false

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_time: Timer = $CoyoteTime
@onready var slow_time: Timer = $SlowTime

func _physics_process(delta: float) -> void:
	if global.restart == true:
		Engine.time_scale = 1
		global.restart = false
	var was_on_floor = is_on_floor()
	# Add the gravity.
	if not is_on_floor() && global.coyote_time == false:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() || global.coyote_time):
		velocity.y = JUMP_VELOCITY
		if global.coyote_time:
			coyote_time.start()
	# Adds a double jump 
	if Input.is_action_just_pressed("jump") && (!is_on_floor() || global.coyote_time == true):
		if has_double_jump == true:
			velocity.y = JUMP_VELOCITY
			has_double_jump = false
		if global.coyote_time == false:
			has_double_jump = true
	if is_on_floor():
		has_double_jump = true
	# Main time mechanic
	if (Input.is_action_just_pressed("slow") && global.hc_adr > 0):
		Engine.time_scale = Engine.time_scale + 1
		slow_time.start()
		global.hc_adr = global.hc_adr - 1 
	if (Input.is_action_just_pressed("coffee") && global.hc_coffee > 0):
		Engine.time_scale = Engine.time_scale + 0.5
		slow_time.start()
		global.hc_coffee = global.hc_coffee - 1
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	# Flips sprite 
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	move_and_slide()
	# Coyote time here as well
	if was_on_floor && !is_on_floor() && velocity.y >= 0:
		global.coyote_time = true
		coyote_time.start()
# Adds coyote time for better movement
func _on_coyote_time_timeout() -> void:
	global.coyote_time = false
# Slows down time constantly
func _on_slow_time_timeout() -> void:
	if Engine.time_scale <= 0.50:
		get_tree().reload_current_scene()
		Engine.time_scale = 1
	Engine.time_scale = Engine.time_scale - 0.01
	slow_time.start()
	
