extends Control

var game_screen_list = ["home_base", "fishing_minigame"]
var game_screen_list_iterator = 0
var transitioned = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$score_counter.text = str(Global.score)
	if game_screen_list[game_screen_list_iterator] == "home_base" && ! transitioned:
		$home_base.show()
		$fishing_minigame.hide()
		transitioned = true
		
	if game_screen_list[game_screen_list_iterator] == "fishing_minigame" && ! transitioned:
		$fishing_minigame.show()
		$home_base.hide()
		
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
