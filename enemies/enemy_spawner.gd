extends Node2D
@export var enemy_soldier_scene: PackedScene #our soldier
@export var enemy_path_component: PathComponent #path the enemy is going to follow

@onready var spawn_component = $SpawnComponent
@onready var spawn_timer_enemy_soldier = $SpawnTimerEnemySoldier

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_soldier_scene = GameManager.ENEMY_SOLDIER_SCENE
	spawn_timer_enemy_soldier.timeout.connect(_timer_spawn.bind(enemy_soldier_scene))
	


func _timer_spawn(enemy_scene: PackedScene):
	var properties = {"enemy_path_component":enemy_path_component}
	spawn_component.scene = enemy_scene
	spawn_component.spawn(Vector2(-100,0),properties)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
