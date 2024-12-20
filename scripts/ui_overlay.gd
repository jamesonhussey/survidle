extends Control

#TODO: Add show/hide button for shop menu.
#FIXME: HUNTER MAP SPAWN ISSUE: Hunters spawn when map is scaled normally, but when scene instance scale is changed to 4, 4 in ui_overlay scene tree, hunters no longer appear when spawned. Which is odd considering that scaling in this way works completely fine in logistics_runner_map. I remember having a similar issue with the logi runner map though, and I think I only fixed it by creating the global spawn position holding variables. Maybe just upscale the map sprite and see if that fixes it. I think it's having an issue when trying to convert 1x scale coordinates to 4x scale coordinates for the spawn locations. 

var game_screen_list = ["home_base", "fishing_minigame", "logistics_runner_map", "hunter_map"]
var game_screen_list_iterator = 0
var transitioned = true

func _ready() -> void:
	pass # Replace with function body.

# OPTIMIZE: OBVIOUSLY just check once for ! transitioned and then check all the others afterwards
func _process(_delta: float) -> void:
	$score_counter.text = str(snapped(Global.score, 1))
	if game_screen_list[game_screen_list_iterator] == "home_base" && ! transitioned:
		$home_base.show()
		$fishing_minigame.hide()
		$logistics_runner_map.hide()
		$hunter_map.hide()
		
		transitioned = true
		
	if game_screen_list[game_screen_list_iterator] == "fishing_minigame" && ! transitioned:
		$home_base.hide()
		$fishing_minigame.show()
		$logistics_runner_map.hide()
		$hunter_map.hide()
		
		transitioned = true
		
	if game_screen_list[game_screen_list_iterator] == "logistics_runner_map" && ! transitioned:
		$home_base.hide()
		$fishing_minigame.hide()
		$logistics_runner_map.show()
		$hunter_map.hide()
		
		transitioned = true
		
	if game_screen_list[game_screen_list_iterator] == "hunter_map" && ! transitioned:
		$home_base.hide()
		$fishing_minigame.hide()
		$logistics_runner_map.hide()
		$hunter_map.show()
		
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
