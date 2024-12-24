extends CharacterBody2D

func _ready() -> void:	
	$AnimatedSprite2D.play("raider_idle")
	$ticker.start()

func _on_ticker_timeout() -> void:
	Global.score += Global.raider_sps
