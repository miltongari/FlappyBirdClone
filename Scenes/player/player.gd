extends CharacterBody2D

# evento
signal onGameStarted

@export var gravity = 1000
@export var jumpForce = 400
@export var maxSpeed = 400
@export var rotationSpeed = 2.0


var isStarted := false
var shouldProcessInput := true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and shouldProcessInput:
		if isStarted == false:
			isStarted = true
			onGameStarted.emit()
		jump()
		
	if isStarted == false:
		return

	# checar en el doc para saber que hacen
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, maxSpeed)
		
	
	move_and_slide()
	rotatePlayer()
	
	
func jump() -> void:
	velocity.y = -jumpForce
	rotation = deg_to_rad(-30)
	$AnimatedSprite2D.play("jump")
	
	
func rotatePlayer() -> void:
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += rotationSpeed * deg_to_rad(1)
		if rad_to_deg(rotation) > 55:
			$AnimatedSprite2D.play("idle")
