extends Node2D

@export var delay := 0.37


func _ready():
	await get_tree().create_timer(delay).timeout
	$goog.play("ham")
