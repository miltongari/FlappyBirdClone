extends CharacterBody2D

@export var gravity = 1000
@export var jumpForce = 400
@export var maxSpeed = 400
@export var rotationSpeed = 2.0


func _physics_process(delta: float) -> void:
	# checar en el doc para saber que hacen
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, maxSpeed)
	
	if Input.is_action_just_pressed("jump"):
		jump()
		
	move_and_slide()
	rotatePlayer()
	
	
func jump() -> void:
	velocity.y = -jumpForce
	rotation = deg_to_rad(-30)

func rotatePlayer() -> void:
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += rotationSpeed * deg_to_rad(1)
