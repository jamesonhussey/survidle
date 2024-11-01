extends CharacterBody2D

# TODO: Add collision zones at various points in the map for various fishing line length checkpoints.

# TODO: Make fish attach to hook when caught. Possibly just make a new fish scene, but likely just use .disabled = true on the area 2Ds that would interact with the hook. 

const lateral_speed = 300
const downward_speed = 200

var fish_caught_on_hook = []

func _physics_process(delta: float) -> void:
	player_movement(delta)
	vertical_movement(delta)

func _process(delta: float) -> void:
	if Global.caught_fish_array.size() >= 1:
		fish_caught_on_hook.push_back(Global.caught_fish_array.pop_at(0))


func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = lateral_speed
	if Input.is_action_pressed("ui_left"):
		velocity.x = lateral_speed * -1
	else:
		pass
	move_and_slide()

func vertical_movement(delta):
	if ! Global.collided_with_fish_going_down:
		velocity.y = downward_speed
	else:
		velocity.y = -downward_speed

func fish_hook():
	pass
