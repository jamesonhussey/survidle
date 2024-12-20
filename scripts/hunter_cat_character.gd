extends CharacterBody2D

func _ready() -> void:	
	$AnimatedSprite2D.play("ranged_attack")
	$ticker.start()

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _on_ticker_timeout() -> void:
	Global.score += Global.hunter_sps
