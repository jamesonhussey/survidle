extends CharacterBody2D

var to_truck_anim_playing = false
var to_door_anim_playing = false
var current_direction = null

var SPEED = randi_range(5, 100)

func _ready() -> void:
	$ticker.start()
	

func _physics_process(delta: float) -> void:
	choose_direction()
	move_in_direction()
	
	#if self.position.x < Global.logi_map_truck_marker_x:
		#velocity.x = SPEED
		#if ! to_truck_anim_playing:
			#$animations.play("push_crate")
			#to_truck_anim_playing = true
			#to_door_anim_playing = false
	#if self.position.x < Global.logi_map_door_marker_x:
		#velocity.x = - SPEED
		#if ! to_door_anim_playing:
			#$animations.play("walk")
			#to_door_anim_playing = true
			#to_truck_anim_playing = false
	move_and_slide()

func move_in_direction():
	if current_direction == "left":
		velocity.x = - SPEED
		$animations.flip_h = true
		$animations.play("walk")
	if current_direction == "right":
		velocity.x = SPEED
		$animations.flip_h = false
		$animations.play("push_crate")

func choose_direction():
	if self.position.x > Global.logi_map_truck_marker_x:
		current_direction = "left"
	if self.position.x < Global.logi_map_door_marker_x:
		current_direction = "right"
	if ! current_direction:
		current_direction = "right"

func _on_ticker_timeout() -> void:
	Global.score += Global.logi_runner_sps
