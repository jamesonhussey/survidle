extends Node2D

# TODO: I think home base should be the only place where the upgrades menu comes up. (I.e., upgrades that will double the output of fishing helpers for example)

# TODO: Home base will be where the standard clicker-type game is to get started

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$map.play("fire_burning")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
