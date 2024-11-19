extends Control

var game_screen_list = ["home_base", "fishing_minigame", "logistics_runner_map"]
var game_screen_list_iterator = 0
var transitioned = true

func _ready() -> void:
	pass # Replace with function body.

# OPTIMIZE: OBVIOUSLY just check once for ! transitioned and then check all the others afterwards
func _process(delta: float) -> void:
	$score_counter.text = str(snapped(Global.score, 1))
	if game_screen_list[game_screen_list_iterator] == "home_base" && ! transitioned:
		$home_base.show()
		$fishing_minigame.hide()
		$logistics_runner_map.hide()
		
		transitioned = true
		
	if game_screen_list[game_screen_list_iterator] == "fishing_minigame" && ! transitioned:
		$home_base.hide()
		$fishing_minigame.show()
		$logistics_runner_map.hide()
		
		transitioned = true
		
	if game_screen_list[game_screen_list_iterator] == "logistics_runner_map" && ! transitioned:
		$home_base.hide()
		$fishing_minigame.hide()
		$logistics_runner_map.show()
		
		transitioned = true

func _on_go_right_button_button_down() -> void:
	if game_screen_list_iterator == (game_screen_list.size() - 1):
		pass
	elif game_screen_list_iterator > (game_screen_list.size() - 1):
		game_screen_list_iterator = (game_screen_list.size() - 1)
	else:
		game_screen_list_iterator += 1
		transitioned = false


func _on_go_left_button_button_down() -> void:
	if game_screen_list_iterator == 0:
		pass
	elif game_screen_list_iterator < 0:
		game_screen_list_iterator = 0
	else:
		game_screen_list_iterator -= 1
		transitioned = false
