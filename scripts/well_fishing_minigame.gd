extends Node2D

@onready var spawn_container_container = $spawn_container_container

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	generate_fish_layout()

func generate_fish_layout():
	for spawn_container in spawn_container_container.get_children:
		var picked_fish = []
		for marker in spawn_container.get_children:
			var fish_rarity_level = pick_fish_rarity()
			picked_fish.push_back(fish_rarity_level)
			# TODO: Spawn fish at marker according to what rarity has been selected. I think the picked_fish array above this may not be necessary since we're already just iterating through everything here, we can just spawn the fish as we go here. I'm too tired to think it all the way through right now, though.

func pick_fish_rarity():
	var rarity = 1
	# Rarity is basically "1/uncommon_chance", for example
	var uncommon_chance = 2
	var rare_chance = 2
	var epic_chance = 2
	var legendary_chance = 2
	var impossible_chance = 2
	if (randi() % uncommon_chance) == (uncommon_chance - 1):
		rarity = 2
		if (randi() % rare_chance) == (rare_chance - 1):
			rarity = 3
			if (randi() % epic_chance) == (epic_chance -1):
				rarity = 4
				if (randi() % legendary_chance) == (legendary_chance -1):
					rarity = 5
					if (randi() % legendary_chance) == (legendary_chance -1):
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
