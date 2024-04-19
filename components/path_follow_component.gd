# This component is designed to make a Node2D actor follow a predefined path.
class_name PathFollowComponent
extends Node

# 'actor' allows the assignment of a Node2D that will follow the path.
# 'speed' determines the rate at which the actor moves along the path.
@export var actor: Node2D
@export var speed: float = 0.1

var path_component: PathComponent
var path_follow_2d: PathFollow2D
var progress_ratio: float = 0.0 # Tracks how far along the path the actor has moved, as a ratio(0 to 1).
var path_reached:bool = false # Flag to indicate whether the path has been fully traversed.

# A signal that is emitted when the actor completes the path.
signal path_complete 

# Called when the node enters the scene tree for the first time.
func path_follow(path_component: PathComponent):
	if not actor:
		actor = get_parent()  # Automatically try and use the parent node as the actor if none is specified.
	
	self.path_component = path_component  # Store the provided PathComponent.
	
	path_follow_2d = PathFollow2D.new()  # Create a new PathFollow2D instance.
	path_follow_2d.loop = false # Ensure the path is only followed once, not looped.
	path_component.add_child(path_follow_2d)	  # Add the PathFollow2D as a child of the PathComponent (requirement by godot for this to work).
	path_follow_2d.progress_ratio = progress_ratio # Initialize the progress along the path.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if path_follow_2d and actor and (not path_reached):
		# Increment the progress_ratio based on the speed and the time since the last frame.
		path_follow_2d.progress_ratio += speed * delta

		# Update the actor's global position to the new position on the path		
		actor.global_position = path_follow_2d.global_position

		# actor rotates along the path
		actor.global_rotation = path_follow_2d.global_rotation
		
		# Check if the end of the path has been reached.
		if(path_follow_2d.progress_ratio == 1): #1 means reached (starting from 0)
			path_reached =true   # Set the flag to prevent further movement.
			path_complete.emit() # Emit the path_complete signal to notify other parts of the game.
		
		
		
