extends Node2D

var fish_rarity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assign_rarity()

# OPTIMIZE: The fish rarity selector is currently in the minigame scene. It could be brought here to clean things up and prevent the use of Global vars unnecessarily.
func assign_rarity():
	fish_rarity = Global.spawned_fish_rarity
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
