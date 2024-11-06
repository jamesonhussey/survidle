extends CharacterBody2D

# TODO: Look up how to spawn more instances at specific spawn points so when another cat is bought, it spawns in the correct location on the map

func _ready() -> void:
	$cat_animations.play("idle")
	$ticker.start()

func _physics_process(delta: float) -> void:
	pass

func _on_ticker_timeout() -> void:
	Global.score += Global.fisher_sps
