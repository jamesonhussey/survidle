extends Node2D

# FIXME: Logi runners are not spawning when purchased

var Worker = preload("res://scenes/logistics_runner_cat_character.tscn")
var local_worker_count = 0

@onready var spawn_container = $spawn_container
@onready var cat_container = $cat_container

func _ready() -> void:
	$animated_truck.play("idle")
	Global.logi_map_truck_marker_x = $truck_marker.position.x
	Global.logi_map_door_marker_x = $door_marker.position.x

func _process(delta: float) -> void:
	update_worker_count()

func update_worker_count():
	if Global.logi_runner_count > local_worker_count:
		var worker_instance = Worker.instantiate()
		worker_instance.scale = Vector2(.7,.7)
		var spawns = spawn_container.get_children()
		var index = randi() % spawns.size()
		worker_instance.global_position = spawns[index].global_position
		cat_container.add_child(worker_instance)
		local_worker_count += 1
	elif Global.logi_runner_count < local_worker_count:
		var cats = cat_container.get_children()
		var index = randi() % cats.size()
		cats[index].queue_free()
		local_worker_count -= 1
