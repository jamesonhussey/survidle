extends CharacterBody2D

func _ready() -> void:
	$cat_animations.play("idle")
	$ticker.start()

func _physics_process(delta: float) -> void:
	pass

func _on_ticker_timeout() -> void:
	Global.score += Global.fisher_sps
