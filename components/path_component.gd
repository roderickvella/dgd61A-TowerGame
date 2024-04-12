class_name  PathComponent
extends Path2D #Path2D is a node type in Godot used for defining paths in 2D space,

# Called when the node enters the scene tree for the first time.
func _ready():
	if (not curve or curve.get_baked_points().size()==0):
		# If the curve is not defined or there are no baked points, it logs a debug message.
		# This message serves as a warning to the developer that a path needs to be defined for the PathComponent to function properly.
		print_debug("ComponentError: You need to add a path to the map")
