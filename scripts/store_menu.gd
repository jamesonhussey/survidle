extends Control

# FIXME: Change the score counter and all prices to round to the nearest integer, it looks like shit right now.

@onready var recruit_fisherman_button = $ScrollContainer/VBoxContainer/fisherman_container/recruit_fisherman_button
@onready var recruit_logistics_runner_button = $ScrollContainer/VBoxContainer/logistics_runner_container/recruit_logi_price

func _ready() -> void:
	recruit_fisherman_button.text = str(Global.fisher_worker_price)
	recruit_logistics_runner_button.text = str(Global.logi_runner_worker_price)

func _process(delta: float) -> void:
	pass

#OPTIMIZE: Turn this into a universal function for recruiting all units (i.e., receives a var containing the requisite global var and see if you can just do "Global.PASSEDVAR" to refer to whichever one is being passed. Possibly do the same for price increases if possible. 
func _on_recruit_fisherman_button_pressed() -> void:
	if Global.score >= Global.fisher_worker_price:
		Global.score -= Global.fisher_worker_price
		Global.fisher_count += 1
		increase_fisher_worker_price()

func increase_fisher_worker_price():
	Global.fisher_worker_price += (Global.fisher_worker_price * 1.15) - Global.fisher_worker_price
	recruit_fisherman_button.text = str(Global.fisher_worker_price)


func _on_recruit_logi_price_pressed() -> void:
	if Global.score >= Global.logi_runner_worker_price:
		Global.score -= Global.logi_runner_worker_price
		Global.logi_runner_count += 1
		increase_logi_worker_price()

func increase_logi_worker_price():
	Global.logi_runner_worker_price += (Global.logi_runner_worker_price * 1.15) - Global.logi_runner_worker_price
	recruit_logistics_runner_button.text = str(Global.logi_runner_worker_price)
