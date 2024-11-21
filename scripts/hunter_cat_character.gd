extends CharacterBody2D

var to_truck_anim_playing = false
var to_door_anim_playing = false
var current_direction = null

var SPEED = randi_range(5, 100)

func _ready() -> void:
	$ticker.start()
	$AnimatedSprite2D.play("ranged_attack")

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_ticker_timeout() -> void:
	Global.score += Global.hunter_sps
