if(level < 4) {
	if(!levelup){
		level_timer ++
	if(level_timer >= level_duration){
		levelup = true
		level_timer = 0
		}
	}
	if(levelup){
		level += 1
		image_speed = 6;
		image_index = 0;
		levelup = false
	}
}
if(level == 1){
	sprite_index = Sprite1
}else if(level == 2){
	sprite_index = Sprite2
}else if (level == 3){
	sprite_index = Sprite3
}else if (level == 4){
	sprite_index = Sprite4;
}
if(pre_level != level && image_index >= 1){
	image_speed = 0;
	image_index = 1
	pre_level = level
}