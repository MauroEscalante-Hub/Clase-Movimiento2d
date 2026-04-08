extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_Delta: float) -> void:
	pass
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_player_hit() -> void:
	pass # Replace with function body.

func _on_star_timer_timeout() -> void:
	pass # Replace with function body.

func _on_score_timer_timeout() -> void:
	pass # Replace with function body.

func _on_mob_timer_timeout() -> void:
	score += 1
	pass # Replace with function body.
	
func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	mob.position = mob_spawn_location.position

	var direction = mob_spawn_location.rotation + PI / 2

	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
	
	
	
