extends Node

#global variables
var current_map_index =0 #index of the current map being played

#available maps
var maps=[
	preload("res://map/map1.tscn")	
]

#scenes
const ENEMY_SPAWNER_SCENE = preload("res://enemies/enemy_spawner.tscn")
const ENEMY_SOLDIER_SCENE = preload("res://enemies/enemy_soldier.tscn")

#function to get current map
func get_current_map() -> PackedScene:
	return maps[current_map_index]

#function to find and return a node of a specific type under a given parent node
func get_node_by_type(parent, type):
	for child in parent.get_children():
		if is_instance_of(child,type):
			return child
	return null
