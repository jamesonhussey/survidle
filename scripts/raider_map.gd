extends Node2D

# TODO: Currently workers can be spawned at the same Marker2D so some may not show up

var Worker = preload("res://scenes/raider_character.tscn")
var local_raider_count = 0

@onready var spawn_container = $spawn_container
@onready var cat_container = $cat_container

func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	update_worker_count()

func update_worker_count():
	if Global.raider_count > local_raider_count:
		var worker_instance = Worker.instantiate()
		worker_instance.scale = Vector2(3,3)
		var spawns = spawn_container.get_children()
		var index = randi() % spawns.size()
		worker_instance.global_position = spawns[index].global_position
		#if worker_instance.global_position.x > 425:
			#var worker_instance_animations = worker_instance.get_child(0)
			#worker_instance_animations.set_flip_h(true)
		cat_container.add_child(worker_instance)
		local_raider_count += 1
	elif Global.raider_count < local_raider_count:
		var cats = cat_container.get_children()
		var index = randi() % cats.size()
		cats[index].queue_free()
		local_raider_count -= 1
