extends KinematicBody2D

var motion = Vector2()
const GRAVITY = 20
const MAX_SPEED = 400
const ACCELERATION = 50
const JUMP_HEIGHT = -350
const UP = Vector2(0,-1)

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_left"):
		motion.x += -ACCELERATION
		motion.x = max(motion.x, -MAX_SPEED)
		$Sprite.flip_h = true
		#$Sprite.play("walk")
	elif Input.is_action_pressed("ui_right"):
		motion.x += ACCELERATION
		motion.x = min(motion.x, MAX_SPEED)
		$Sprite.flip_h = false
		#$Sprite.play("walk")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		#$Sprite.play("idle")
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		if motion.y < 50:
			pass
			#$Sprite.play("jumpup")
		if motion.y > 50:
			pass
			#$Sprite.play("jumpdown")
	
	motion = move_and_slide(motion, UP)
	pass
