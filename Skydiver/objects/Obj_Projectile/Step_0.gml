if (instance_exists(proj_target) && instance_exists(owner)) {
	part_particles_create(part_sys, x, y, par_trail, irandom_range(2, 5));
    var d = point_distance(x, y, proj_target.x, proj_target.y);

    if (d <= homing_threshold) {
        homing = true;
    }

    if (homing) {
        var dir = point_direction(x, y, proj_target.x, proj_target.y);
        var diff = angle_difference(direction, dir);
        image_angle = lerp(image_angle, dir, 0.1); 
        if (abs(diff) < turn_speed) {
            direction = dir;
        } else {
            if (diff > 0) {
                direction += turn_speed;
            } else {
                direction -= turn_speed;
            }
        }
        speed += acceleration;
    }
} else {
    homing = false;
}

x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

if (instance_exists(proj_target) && instance_exists(owner)) {
    if (place_meeting(x, y, proj_target) && !owner.respawn) {
        var other_p = instance_place(x, y, proj_target);
        if (other_p != noone && other_p.current_state != state.dead) {
            audio_play_sound(Hit, 3, false);
			audio_play_sound(Down, 3, false);
            for (var i = 0; i < 10; i++) {
                var star = instance_create_layer(x, y, "Instances", Obj_Star);
                var ang = random_range(0, 360);
                var spd = random_range(-16, -8);
                star.hspeed = spd * cos(degtorad(ang));
                star.vspeed = spd * sin(degtorad(ang));
            }
            if (instance_exists(owner)) {
                owner.current_state = state.jump_pre;
                owner.point = true;
                owner.invensible = true;
            }
            global.collisionTriggered = true;
			if(owner.invensible){
				var word = irandom(2)
				
				switch(word){
					case 0:
					audio_play_sound(ontarget, 2, false)
					break;
					case 1:
					audio_play_sound(muppet, 2, false)
					break;
					case 2:
					audio_play_sound(GG, 2, false)
					break;
				}
		}
            Obj_Camera.is_shaking = true;
            Obj_Camera.focus = true;
            other_p.respawn = true;
        }
		part_system_destroy(part_sys);
        instance_destroy();
    }
}

if (place_meeting(x, y, Obj_Cloud) || place_meeting(x, y, Obj_Ground) || x < 0 || x > 1376 || y > 1500) {
    for (var i = 0; i < 3; i++) {
        var star = instance_create_layer(x, y, "Instances", Obj_Star);
        var ang = random_range(0, 360);
        var spd = random_range(-16, -8);
        star.hspeed = spd * cos(degtorad(ang));
        star.vspeed = spd * sin(degtorad(ang));
    }
	part_system_destroy(part_sys);
    instance_destroy();
}

if(place_meeting(x, y, Obj_Projectile)){
	for (var i = 0; i < 3; i++) {
            var star = instance_create_layer(x, y, "Instances", Obj_Star);
            var ang = random_range(0, 360);
            var spd = random_range(-16, -8);
            star.hspeed = spd * cos(degtorad(ang));
            star.vspeed = spd * sin(degtorad(ang));
        }
		part_system_destroy(part_sys);
		instance_destroy();
}

if (teleport_cooldown > 0) {
    teleport_cooldown--;
}