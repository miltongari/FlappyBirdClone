extends Node2D

signal onPlayerCrash

@export var moveSpeed := 150.0

func _process(delta: float) -> void:
	position.x -= moveSpeed * delta

func _on_area_body_entered(body: Node2D) -> void:
	onPlayerCrash.emit()
