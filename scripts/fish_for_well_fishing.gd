extends Node2D

var fish_rarity = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assign_rarity()

# OPTIMIZE: The fish rarity selector is currently in the minigame scene. It could be brought here to clean things up and prevent the use of Global vars unnecessarily.
func assign_rarity():
	fish_rarity = Global.spawned_fish_rarity
	Global.spawned_fish_rarity = 0
	if fish_rarity != 0:
		if fish_rarity == 1:
			$common_fish.show()
			$uncommon_fish.hide()
			$rare_fish.hide()
			$epic_fish.hide()
			$legendary_fish.hide()
			$godly_fish.hide()
			$impossible_fish.hide()
		elif fish_rarity == 2:
			$common_fish.hide()
			$uncommon_fish.show()
			$rare_fish.hide()
			$epic_fish.hide()
			$legendary_fish.hide()
			$godly_fish.hide()
			$impossible_fish.hide()
		elif fish_rarity == 3:
			$common_fish.hide()
			$uncommon_fish.hide()
			$rare_fish.show()
			$epic_fish.hide()
			$legendary_fish.hide()
			$godly_fish.hide()
			$impossible_fish.hide()
		elif fish_rarity == 4:
			$common_fish.hide()
			$uncommon_fish.hide()
			$rare_fish.hide()
			$epic_fish.show()
			$legendary_fish.hide()
			$godly_fish.hide()
			$impossible_fish.hide()
		elif fish_rarity == 5:
			$common_fish.hide()
			$uncommon_fish.hide()
			$rare_fish.hide()
			$epic_fish.hide()
			$legendary_fish.show()
			$godly_fish.hide()
			$impossible_fish.hide()
		elif fish_rarity == 6:
			$common_fish.hide()
			$uncommon_fish.hide()
			$rare_fish.hide()
			$epic_fish.hide()
			$legendary_fish.hide()
			$godly_fish.show()
			$impossible_fish.hide()
		elif fish_rarity == 7:
			$common_fish.hide()
			$uncommon_fish.hide()
			$rare_fish.hide()
			$epic_fish.hide()
			$legendary_fish.hide()
			$godly_fish.hide()
			$impossible_fish.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hitbox_top_body_entered(body: Node2D) -> void:
	if body.has_method("fish_hook"):
		Global.collided_with_fish_going_down = true

func _on_hitbox_bottom_body_entered(body: Node2D) -> void:
	Global.collided_with_fish_going_up = true
	Global.caught_fish_array.push_back(fish_rarity)
