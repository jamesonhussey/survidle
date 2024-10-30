extends Control

@onready var recruit_fisherman_button = $ScrollContainer/VBoxContainer/fisherman_container/recruit_fisherman_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	recruit_fisherman_button.text = str(Global.fisher_worker_price)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_recruit_fisherman_button_pressed() -> void:
	if Global.score >= Global.fisher_worker_price:
		Global.score -= Global.fisher_worker_price
		Global.fisher_count += 1
		increase_fisher_worker_price()

func increase_fisher_worker_price():
	Global.fisher_worker_price += (Global.fisher_worker_price * 1.15) - Global.fisher_worker_price
	recruit_fisherman_button.text = str(Global.fisher_worker_price)
