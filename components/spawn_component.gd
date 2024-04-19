# This component is designed to facilitate the spawning of game objects at specified positions in the game world.
class_name SpawnComponent
extends Node

@export var scene: PackedScene #scene to spawn

# The 'spawn' function creates an instance of the specified PackedScene at a given global position.
# 'global_position' specifies where the spawned object should appear in the game world.
# 'properties' is an optional dictionary parameter that allows setting properties on the spawned instance.
# 'parent' specifies the node under which the new instance should be added. 
func spawn(global_position: Vector2, properties: Dictionary = {}, parent: Node=get_tree().current_scene) -> Node:
	if(not scene is PackedScene):
		print_debug("ComponentError: Scene not of type PackedScene")
		return
	
	var instance = scene.instantiate() #create a new instance of the scene.
	
	# Iterate over each item in the 'properties' dictionary.
	for property in properties:
		var value = properties[property]
		# Using the 'set' method to apply each property and its value to the new instance (populated before excuting _ready in instance).
		instance.set(property, value)
	
	# Add the new instance as a child of the specified 'parent' node.
	parent.add_child(instance)
	instance.global_position = global_position
	return instance # Return the newly created instance for further use or reference.
