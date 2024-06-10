extends CharacterBody2D

@export var speed = 200

@onready var animated_sprite = $AnimatedSprite2D
@onready var interact_ui = $InteractUI

func _ready():
	Global.set_player_reference(self)

func _physics_process(delta):
	get_input()
	move_and_slide()
	update_animation()

func get_input():
	var horizontal_movement: float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left");
	var vertical_movement: float = Input.get_action_strength("move_down") - Input.get_action_strength("move_up");
	var movement_vector: Vector2 = Vector2(horizontal_movement, vertical_movement)
	var direction: Vector2 = movement_vector.normalized()
	
	velocity = direction * speed

func update_animation():
	if velocity == Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				animated_sprite.play("walk_right")
			else:
				animated_sprite.play("walk_left")
		else:
			if velocity.y > 0:
				animated_sprite.play("walk_down")
			else:
				animated_sprite.play("walk_up")
