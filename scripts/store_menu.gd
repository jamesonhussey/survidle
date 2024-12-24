extends Control

#NOTE: STEPS FOR ADDING WORKER TO STORE - 1. Add @onready var for the buy button, 2. Add initial price text adjustment to _ready() function, 3. Link purchase button pressed and add its function, 4. Add price increase function.

@onready var recruit_fisherman_button = $ScrollContainer/VBoxContainer/fisherman_container/recruit_fisherman_button
@onready var recruit_logistics_runner_button = $ScrollContainer/VBoxContainer/logistics_runner_container/recruit_logi_price
@onready var recruit_hunter_button = $ScrollContainer/VBoxContainer/hunter_container/recruit_hunter_price
@onready var recruit_raider_button = $ScrollContainer/VBoxContainer/raider_container/recruit_raider_price

func _ready() -> void:
	recruit_fisherman_button.text = str(snapped(Global.fisher_worker_price, .01))
	recruit_logistics_runner_button.text = str(snapped(Global.logi_runner_worker_price, .01))
	recruit_hunter_button.text = str(snapped(Global.hunter_worker_price, .01))
	recruit_raider_button.text = str(snapped(Global.raider_worker_price, .01))

func _process(_delta: float) -> void:
	pass

#OPTIMIZE: Turn this into a universal function for recruiting all units (i.e., receives a var containing the requisite global var and see if you can just do "Global.PASSEDVAR" to refer to whichever one is being passed. Possibly do the same for price increases if possible. 
func _on_recruit_fisherman_button_pressed() -> void:
	if Global.score >= Global.fisher_worker_price:
		Global.score -= Global.fisher_worker_price
		Global.fisher_count += 1
		increase_fisher_worker_price()
		
func increase_fisher_worker_price():
	Global.fisher_worker_price += (Global.fisher_worker_price * 1.15) - Global.fisher_worker_price
	recruit_fisherman_button.text = str(snapped(Global.fisher_worker_price, .01))


func _on_recruit_logi_price_pressed() -> void:
	if Global.score >= Global.logi_runner_worker_price:
		Global.score -= Global.logi_runner_worker_price
		Global.logi_runner_count += 1
		increase_logi_worker_price()
		
func increase_logi_worker_price():
	Global.logi_runner_worker_price += (Global.logi_runner_worker_price * 1.15) - Global.logi_runner_worker_price
	recruit_logistics_runner_button.text = str(snapped(Global.logi_runner_worker_price, .01))


func _on_recruit_hunter_price_pressed() -> void:
	if Global.score >= Global.hunter_worker_price:
		Global.score -= Global.hunter_worker_price
		Global.hunter_count += 1
		increase_hunter_worker_price()
		
func increase_hunter_worker_price():
	Global.hunter_worker_price += (Global.hunter_worker_price * 1.15) - Global.hunter_worker_price
	recruit_hunter_button.text = str(snapped(Global.hunter_worker_price, .01))


func _on_recruit_raider_price_pressed() -> void:
	if Global.score >= Global.raider_worker_price:
		Global.score -= Global.raider_worker_price
		Global.raider_count += 1
		increase_raider_worker_price()
		
func increase_raider_worker_price():
	Global.raider_worker_price += (Global.raider_worker_price * 1.15) - Global.raider_worker_price
	recruit_raider_button.text = str(snapped(Global.raider_worker_price, .01))
