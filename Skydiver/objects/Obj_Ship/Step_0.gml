if (shooting_mode) {
	if(!can_shoot){
		can_timer++
		if(can_timer>= can_duration){
			can_shoot = true;
		}
	}
	if(can_shoot){
		if(!audio){
			audio_play_sound(machingun, 3, true);
			audio = true
		}
		if(!audio2){
			audio_play_sound(Orbital, 2, false);
			audio2 = true
		}
		if(!shot){
			var proj = instance_create_layer(x, y, "Instances", Obj_Projectile_Ship, {proj_target: tar, owner: own});
			var proj2 = instance_create_layer(x - 80, y, "Instances", Obj_Projectile_Ship, {proj_target: tar, owner: own});
			proj.direction = initial_direction; 
			proj.image_angle = initial_direction;
			proj.speed = shoot_speed;
			proj2.direction = initial_direction - 30; 
			proj2.image_angle = initial_direction - 30;
			proj2.speed = shoot_speed;
			shot = true;
		}
		if(shot){
			shot_timer++
			if(shot_timer >= shot_duration){
				shot = false;
				shot_timer = 0;
			}
		}

	    initial_direction += sweep_direction * delta;
    
	    var lower_bound = 180;
	    var upper_bound = 360;
    
	    if (sweep_direction < 0 && initial_direction <= lower_bound) {
	        sweep_direction = 1;
	    }
	    else if (sweep_direction > 0 && initial_direction >= upper_bound) {  
			sweep_direction = -1; 
	    }
		if(initial_direction == 360 && !st_round){
			shooting_time += 1
			st_round = true
		}
		if(st_round){
			rd_timer++
			if(rd_timer >= rd_duration){
				st_round = false;
				rd_timer = 0
			}
		}
		if(shooting_time == 2){
			audio_stop_sound(machingun)
			audio_play_sound(ontarget, 2, false)
			initial_direction = 360;    
			sweep_direction = -1; 
			shooting_time = 0;
	        shooting_mode = false;
			audio = false;
			audio2 = false
			can_shoot = false;
			can_timer = 0;
			if(own == Obj_Player1){
				global.p1cost += 5;
			}else if(own == Obj_Player2){
				global.p2cost += 5;
			}
		}
	}
}
if(fire_mode){
	if(!can_shoot){
		can_timer++
		if(can_timer>= can_duration){
			can_shoot = true;
		}
	}
	if(can_shoot){
		if(!audio){
			audio_play_sound(Au_Explosion2, 3, false);
			audio = true
		}
		if(!audio2){
			audio_play_sound(DGetBurn, 2, false);
			audio2 = true
		}
		var spacing = 120;
        for (var i = -6; i <= 6; i++) {
            var fb = instance_create_layer(x + i*spacing, y, "Instances",Obj_Projectile_Flame, {target: tar, owner: own});
        }
        fire_mode = false;
		audio = false;
		audio2 = false
		can_shoot = false;
		can_timer = 0;
		if(own == Obj_Player1){
				global.p1cost += 5;
			}else if(own == Obj_Player2){
				global.p2cost += 5;
			}
	}
}