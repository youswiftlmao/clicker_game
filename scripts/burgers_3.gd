extends Node2D


@export var delay := 0.72



func _ready():
	await get_tree().create_timer(delay).timeout
	$AAA.play("ham")
