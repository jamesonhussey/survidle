extends Node2D

# TODO: Finish setting up fish spawns on map and add random fish here and there out of the pattern. 
# TODO: Add a blank space to one of the markers in each row by queue_free() - ing a random one

var fish_for_well_fishing_scene = preload("res://scenes/fish_for_well_fishing.tscn")
@onready var spawn_container_container = $spawn_container_container

var down_speed
var lateral_speed = 100

func _ready() -> void:
	randomize()
	generate_fish_layout()

func generate_fish_layout():
	for spawn_container in spawn_container_container.get_children():
		var picked_fish = []
		for marker in spawn_container.get_children():
			var fish_rarity_level = pick_fish_rarity()
			Global.spawned_fish_rarity = fish_rarity_level
			var spawned_fish_instance = fish_for_well_fishing_scene.instantiate()
			spawned_fish_instance.scale = Vector2(2,2)
			marker.add_child(spawned_fish_instance)
			# TODO: Spawn fish at marker according to what rarity has been selected. I think the picked_fish array above this may not be necessary since we're already just iterating through everything here, we can just spawn the fish as we go here. I'm too tired to think it all the way through right now, though.

func pick_fish_rarity():
	var rarity = 1
	# Rarity is basically "1/uncommon_chance", for example
	var uncommon_chance = 2
	var rare_chance = 2
	var epic_chance = 2
	var legendary_chance = 2
	var godly_chance = 2
	var impossible_chance = 2
	if (randi() % uncommon_chance) == (uncommon_chance - 1):
		rarity = 2
		if (randi() % rare_chance) == (rare_chance - 1):
			rarity = 3
			if (randi() % epic_chance) == (epic_chance -1):
				rarity = 4
				if (randi() % legendary_chance) == (legendary_chance -1):
					rarity = 5
					if (randi() % godly_chance) == (godly_chance -1):
						rarity = 6
						if (randi() % impossible_chance) == (impossible_chance -1):
							rarity = 7
							return rarity
						else:
							return rarity
					else:
						return rarity
				else:
					return rarity
			else:
				return rarity
		else:
			return rarity
	else:
		return rarity


func _process(delta: float) -> void:
	pass
