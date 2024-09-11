extends CharacterBody2D

#角色的移动速度
const SPEED = 60.0

#角色的动画对象
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	
	# 四个动作的四个方向 - + - +
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	
	# velocity 和 move_and_slide 绑定在一起
	velocity = direction * SPEED
	
		# 设置播放动画
	if direction.x != 0 || direction.y != 0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
		
	# 设置人物反转
	if direction.x < 0:
		animated_sprite.flip_h = true
	elif direction.x > 0:
		animated_sprite.flip_h = false
		
		
	# 设置移动
	move_and_slide()
		
		
	
	
	
