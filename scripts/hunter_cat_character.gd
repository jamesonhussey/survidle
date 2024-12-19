extends CharacterBody2D

func _ready() -> void:
	$ticker.start()
	$AnimatedSprite2D.play("ranged_attack")

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_ticker_timeout() -> void:
	Global.score += Global.hunter_sps
	$AnimatedSprite2D.play("ranged_attack")
