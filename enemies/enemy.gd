class_name Enemy #base class
extends Node

@onready var enemy_path_component: PathComponent
@onready var path_follow_component = $PathFollowComponent as PathFollowComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	path_follow_component.path_follow(enemy_path_component)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
