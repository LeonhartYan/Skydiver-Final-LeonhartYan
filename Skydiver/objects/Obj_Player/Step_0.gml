function move() {
	if(type == 1){
	left  = keyboard_check(ord("J"));
    right = keyboard_check(ord("L"));
	shoot = keyboard_check(ord("I"));
	reload_btn = keyboard_check(ord("K"));
	strata = keyboard_check(188)
	}else if(type == 2){
		left  = keyboard_check(ord("A"))
		right = keyboard_check(ord("D"))
		shoot = keyboard_check(ord("W"))
		reload_btn = keyboard_check(ord("S"));
		strata = keyboard_check(ord("X"))
	}
	
    if (left) {
        if (place_meeting(x - obstacle, y, Obj_RoomWall)) {
			wall = true;
            while (place_meeting(x, y, Obj_RoomWall)) {
                x += 20
            }
            horizontal_velocity = 0;
        } else {
            horizontal_velocity -= walk_acceleration;
            if (horizontal_velocity < -walk_max_vel) {
                horizontal_velocity = -walk_max_vel;
            }
        }
        image_xscale = 1;
    }

    if (right) {
        if (place_meeting(x + obstacle, y, Obj_RoomWall)) {
			wall = true
            while (place_meeting(x, y, Obj_RoomWall)) {
                x -= 20
            }
            horizontal_velocity = 0;
        } else {
            horizontal_velocity += walk_acceleration;
            if (horizontal_velocity > walk_max_vel) {
                horizontal_velocity = walk_max_vel;
            }
        }
        image_xscale = -1;
    }

    if (!left && !right) {
        if (horizontal_velocity > 0) {
            if (place_meeting(x + obstacle, y, Obj_RoomWall)) {
				wall = true
                while (place_meeting(x, y, Obj_RoomWall)) {
                    x -= 20
                }
                horizontal_velocity = 0;
            } else {
                horizontal_velocity -= walk_acceleration;
                if (horizontal_velocity < 0) {
                    horizontal_velocity = 0;
                }
            }
        } else if (horizontal_velocity < 0) {
            if (place_meeting(x - obstacle, y, Obj_RoomWall)) {
				wall = true
                while (place_meeting(x, y, Obj_RoomWall)) {
                    x += 20
                }
                horizontal_velocity = 0;
            } else {
                horizontal_velocity += walk_acceleration;
                if (horizontal_velocity > 0) {
                    horizontal_velocity = 0;
                }
            }
        }
    }
}



if (strata) {
    if (type == 2 && !Obj_Ship.shooting_mode && !Obj_Ship.fire_mode && !instance_exists(Obj_Flame)) {
        var minCost2 = global.cost_list2[0];
        for (var i = 1; i < array_length(global.cost_list2); i++) {
            minCost2 = min(minCost2, global.cost_list2[i]);
        }
        if (global.ply2coin >= minCost2) {
            if (keyboard_check_pressed(ord("W"))) {
                command_input += "W"; audio_play_sound(type1,4,false); Obj_Camera.is_small_shaking = true;
            }
            if (keyboard_check_pressed(ord("A"))) {
                command_input += "A"; audio_play_sound(type1,4,false); Obj_Camera.is_small_shaking = true;
            }
            if (keyboard_check_pressed(ord("S"))) {
                command_input += "S"; audio_play_sound(type1,4,false); Obj_Camera.is_small_shaking = true;
            }
            if (keyboard_check_pressed(ord("D"))) {
                command_input += "D"; audio_play_sound(type1,4,false); Obj_Camera.is_small_shaking = true;
            }
        }

        var ok2 = false;
        for (var j = 0; j < array_length(cmd_list); j++) {
            if (string_pos(command_input, cmd_list[j]) == 1) {
                ok2 = true;
                break;
            }
        }
        if (!ok2) command_input = "";

        if (command_input == orbital_strike) {
            var cost0 = global.cost_list2[0];
            if (global.ply2coin >= cost0) {
                global.ply2coin       -= cost0;
                audio_play_sound(firemission,2,false);
                Obj_Ship.tar           = Obj_Player1;
                Obj_Ship.own           = Obj_Player2;
                Obj_Ship.shooting_mode = true;
				global.cost_list2[0] += global.p2cost
            }
            command_input = "";
        }
        else if (command_input == gatling_sentry) {
            var cost3 = global.cost_list2[3];
            if (global.ply2coin >= cost3 && !global.ply2sentry) {
				global.ply2coin -= cost3;
				global.ply2sentry = true;
				audio_play_sound(Sentry,3,false);
                instance_create_layer(irandom_range(100,1300),190,"Instances",Obj_Hellpod_Item,{container:target,owner:player});
				global.cost_list2[3] += global.p2cost
            }
            command_input = "";
        }
        else if (command_input == orbital_flame) {
            var cost2 = global.cost_list2[2];
            if (global.ply2coin >= cost2 && !Obj_Ship.fire_mode) {
                global.ply2coin   -= cost2;
                audio_play_sound(firemission,2,false);
				Obj_Ship.tar           = Obj_Player1;
                Obj_Ship.own           = Obj_Player2;
                Obj_Ship.fire_mode  = true;
				global.cost_list2[2] += global.p2cost
            }
            command_input = "";
        }
		else if (command_input == machine_gun){
			var cost1 = global.cost_list2[1];
			if(global.ply2coin >= cost1){
				global.ply2coin -= cost1;
				audio_play_sound(SupArms,3,false);
				instance_destroy(gun)
				instance_create_layer(x-5, y + 10, "Instances", Obj_Gun_Sentry, {owner: player, target: target})
				max_ammo = 20
				ammo = 20;
				mg = true
				global.cost_list2[1] += global.p2cost
			}
			command_input = "";
		}else if(command_input == empbomb){
			var cost4 = global.cost_list2[4]
			if(global.ply2point >= cost4){
			audio_play_sound(EMPAc,3,false);
			global.winner = player;
			instance_create_layer(irandom_range(100,1300),190,"Instances",Obj_EMP);
			}
			command_input = "";
		}
    }

    else if (type == 1 && !Obj_Ship.shooting_mode && !Obj_Ship.fire_mode && !instance_exists(Obj_Flame)) {
        var minCost1 = global.cost_list1[0];
        for (var i = 1; i < array_length(global.cost_list1); i++) {
            minCost1 = min(minCost1, global.cost_list1[i]);
        }
        if (global.ply1coin >= minCost1) {
            if (keyboard_check_pressed(ord("I"))) {
                command_input += "W"; audio_play_sound(type1,4,false); Obj_Camera.is_small_shaking = true;
            }
            if (keyboard_check_pressed(ord("J"))) {
                command_input += "A"; audio_play_sound(type1,4,false); Obj_Camera.is_small_shaking = true;
            }
            if (keyboard_check_pressed(ord("K"))) {
                command_input += "S"; audio_play_sound(type1,4,false); Obj_Camera.is_small_shaking = true;
            }
            if (keyboard_check_pressed(ord("L"))) {
                command_input += "D"; audio_play_sound(type1,4,false); Obj_Camera.is_small_shaking = true;
            }
        }

        var ok1 = false;
        for (var j = 0; j < array_length(cmd_list); j++) {
            if (string_pos(command_input, cmd_list[j]) == 1) {
                ok1 = true;
                break;
            }
        }
        if (!ok1) command_input = "";

        if (command_input == orbital_strike) {
            var cost0 = global.cost_list1[0];
            if (global.ply1coin >= cost0) {
                global.ply1coin       -= cost0;
                audio_play_sound(firemission,2,false);
                Obj_Ship.tar           = Obj_Player2;
                Obj_Ship.own           = Obj_Player1;
                Obj_Ship.shooting_mode = true;
				global.cost_list1[0] += global.p1cost;
            }
            command_input = "";
        }
        else if (command_input == gatling_sentry) {
            var cost3 = global.cost_list1[3];
            if (global.ply1coin >= cost3 && !global.ply1sentry) {
                global.ply1coin -= cost3;
				global.ply1sentry = true;
				audio_play_sound(Sentry,3,false);
				global.cost_list1[3] += global.p1cost
                instance_create_layer(irandom_range(100,1300),190,"Instances",Obj_Hellpod_Item,{container:target,owner:player});
            }
            command_input = "";
        }
        else if (command_input == orbital_flame) {
            var cost2 = global.cost_list1[2];
            if (global.ply1coin >= cost2 && !Obj_Ship.fire_mode) {
                global.ply1coin    -= cost2;
                audio_play_sound(firemission,2,false);
				Obj_Ship.tar           = Obj_Player2;
                Obj_Ship.own           = Obj_Player1;
                Obj_Ship.fire_mode   = true;
				global.cost_list1[2] += global.p1cost
            }
            command_input = "";
        }
		else if (command_input == machine_gun){
			var cost1 = global.cost_list1[1];
			if(global.ply1coin >= cost1){
				global.ply1coin -= cost1;
				audio_play_sound(SupArms,3,false);
				instance_destroy(gun)
				instance_create_layer(x-5, y + 10, "Instances", Obj_Gun_Sentry, {owner: player, target: target})
				max_ammo = 20
				ammo = 20;
				mg = true
				global.cost_list1[1] += global.p1cost
			}
			command_input = "";
		}
		else if(command_input == empbomb){
			var cost4 = global.cost_list1[4]
			if(global.ply1point >= cost4){
			audio_play_sound(EMPAc,3,false);
			global.winner = player;
			instance_create_layer(irandom_range(100,1300),190,"Instances",Obj_EMP);
			}
			command_input = "";
		}
    }
}else{
	command_input = "";
}



if (shoot && !reload && !strata && ! fast_reload) {
    if (shoot_cooldown <= 0 && instance_exists(player) && instance_exists(target)) {
        var proj = instance_create_layer(x, y, "Instances", Obj_Projectile, {
		proj_target: target,
		owner: player
		});
		ammo -= 1;
		audio_play_sound(Shoot, 3, false);
        shoot_cooldown = shoot_cooldown_duration;
    }
}
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}

if (!reload) {
    if (ammo == 0) {
        reload = true;
        rld_timer = 0;
    }
}

if (reload) {
    rld_timer++;
    if (rld_timer >= rld_duration) {
        reload = false;
        ammo = max_ammo;
        rld_timer = 0;
    }
}

if (!reload && !fast_reload) {
    if (!reload && reload_btn && ammo != max_ammo) {
        fast_reload = true;
        frld_timer = 0;
    }
}

if (fast_reload) {
    frld_timer++;
    if (frld_timer >= frld_duration) {
        fast_reload = false;
		reload = false;
        ammo = max_ammo;
        frld_timer = 0;
		rld_timer = 0;
    }
}

switch(current_state){
	case state.launch:
	if(!launched){
		var angle = random_range(60, 120);
		horizontal_velocity = launch_vel * cos(degtorad(angle));
        vertical_velocity   = - launch_vel * sin(degtorad(angle));
        launched = true;
	}
	if (horizontal_velocity < 0) {
            if (place_meeting(x - obstacle, y, Obj_RoomWall)) {
                horizontal_velocity = abs(horizontal_velocity);
            }
        }
    else if (horizontal_velocity > 0) {
            if (place_meeting(x + obstacle, y, Obj_RoomWall)) {
                horizontal_velocity = -abs(horizontal_velocity);
            }
        }
	if(y <= launch_limit){
		vertical_velocity = fall_gravity-30;
		current_state = state.fall;
		launched = false;
	}
	sprite_index = jump_spr
	break;
	
	case state.jump_pre:
		sprite_index = jump_spr
		image_speed = 0;
		image_index = 0;
		vertical_velocity = -jump_init_impulse;
		current_state = state.jump
		jump_timer = 0;
	break;
	case state.jump:
	image_index = 0;
		jump_timer ++;
		vertical_velocity -= jump_acceleration
		if(vertical_velocity < -jump_max_vel){
			vertical_velocity = - jump_max_vel;
		}
		if(jump_timer >= jump_duration){
		current_state = state.fall;
		jump_timer = 0;
		}
	break;
	
	case state.fall:
		vertical_velocity += fall_gravity;
		if(vertical_velocity > falling_change_vel){
			image_speed = 2;
			if(image_index == 2){
				image_speed = 0;
				image_index = 0;
				sprite_index = fall_spr
			}
		}
		if(vertical_velocity > falling_max_vel){
			vertical_velocity = falling_max_vel
		}
		
		if(place_meeting(x, y, Obj_Cloud)){
			var cld = instance_place(x, y, Obj_Cloud);
			if(vertical_velocity > 0 && bbox_bottom <= cld.y){
				var ind = ds_list_find_index(global.clouds, cld)
				ds_list_delete(global.clouds, ind)
				if(cld.level == 1 && cld != noone){
					instance_create_layer(cld.x, cld.y, "Instances", Obj_CloudExplosion)
				}else{
					var gap = (cld.sprite_width - (sprite_get_width(Spr_CloudExp)*cld.level))/(cld.level-1)
					var startX = cld.x - cld.sprite_width * 0.5 + sprite_get_width(Spr_CloudExp) * 0.5;
					for (var i = 0; i < cld.level; i++) {
					var exX = startX + i * (sprite_get_width(Spr_CloudExp) + gap);
					instance_create_layer(exX, cld.y, "Instances", Obj_CloudExplosion);
				 }
				}
				
				instance_destroy(cld)
				audio_play_sound(jump, 3, false)
				current_state = state.jump_pre
			}
		}
		
		if(place_meeting(x, y, Obj_Flame)){
			var flm = instance_place(x, y, Obj_Flame);
			if(vertical_velocity > 0 && bbox_bottom <= flm.y && flm.flame_target == player){
			for (var i = 0; i < 10; i++) {
                var star = instance_create_layer(x, y, "Instances", Obj_Star);
                var angle = random_range(180, 360);
                var spd = random_range(10, 18);
                star.hspeed = spd * cos(degtorad(angle));
                star.vspeed = spd * sin(degtorad(angle));
            }
			point = true;
			if(point){
				if(type == 1){
					global.ply2point += 1
					global.ply2coin += 1;
					global.ply2mult += 1;
					global.ply1mult = 1;
				}else if(type == 2){
					global.ply1point += 1
					global.ply1coin += 1;
					global.ply1mult += 1;
					global.ply2mult = 1;
				}
				point_timer++
				if(point_timer >= point_duration){
					point = false;
					point_timer = 0;
				}
			}
			global.collisionTriggered = true;
            Obj_Camera.is_shaking = true;
            Obj_Camera.focus = true;
			audio_play_sound(Down, 3, false)
			respawn = true
			}
		}
		
		if(place_meeting(x, y, Obj_Wall_Collider)){
			point = true;
			if(point){
				if(type == 1){
					global.ply1point -= 1;
					global.ply1mult = 1;
				}else if(type == 2){
					global.ply2point -= 1;
					global.ply2mult = 1;
				}
			for (var i = 0; i < 10; i++) {
                var star = instance_create_layer(x, y, "Instances", Obj_Star);
                var angle = random_range(180, 360);
                var spd = random_range(10, 18);
                star.hspeed = spd * cos(degtorad(angle));
                star.vspeed = spd * sin(degtorad(angle));
            }
			audio_play_sound(Down, 3, false)
				point_timer++
				if(point_timer >= point_duration){
					point = false;
					point_timer = 0;
				}
			}
			respawn = true
		}
	break;
	
	case state.dead:
	freeze = true;
	global.first = false;
	image_angle = -180
	if(type == 1){
		global.ply1mult = 1;
	}else if(type == 2){
		global.ply2mult = 1;
	}
	if(global.collisionTriggered){
		vertical_velocity = 30
	}
	if(place_meeting(x, y, Obj_Wall_Collider)){
		vertical_velocity = 0;
		visible = false
	}
	break;
}

if(freeze){
	vertical_velocity = 5;
	horizontal_velocity = 0;
	image_speed = 0;
	frez_timer ++
	if(frez_timer >= frez_duration){
		freeze = false;
		vertical_velocity += 30
	}
}

if(respawn){
	current_state = state.dead
			resp_timer ++
		}
if(resp_timer >= resp_duration){
		audio_play_sound(Respawn, 3, false)
		var newplayer = instance_create_layer(irandom_range(100,1300), 190, "Instances", Obj_Hellpod, {container: player})
		respawn = false;
		resp_timer = 0
		current_state = state.launch;
		if(newplayer != noone){instance_destroy()}
}

if(invensible){
				invi_timer++
				if(invi_timer >= invi_duration){
					invensible = false;
					invi_timer = 0;
				}
}
if(point){
	if(type == 1){
		global.ply1point += 1;
		global.ply1coin += 1 * global.ply1mult;
		global.ply1mult += 1;
	}else if(type == 2){
		global.ply2point += 1;
		global.ply2coin += 1 * global.ply2mult;
		global.ply2mult += 1;
	}
	point_timer++
	if(point_timer >= point_duration){
		point = false;
		point_timer = 0;
	}
}

if(point_strata){
	if(type == 1){
		global.ply1point += 1;
		global.ply1coin += 1;
		global.ply1mult += 1;
	}else if(type == 2){
		global.ply2point += 1;
		global.ply2coin += 1;
		global.ply2mult += 1;
	}
	point_strata_timer++
	if(point_strata_timer >= point_strata_duration){
		point_strata = false;
		point_strata_timer = 0;
	}
}


	
if(current_state != state.launch){move()}
	
if(wall){
			wall_timer ++
if(wall_timer >= wall_duration){
audio_play_sound(Hit_Wall, 3, false)
wall = false;
wall_timer = 0;
}
}

if(!armed && !mg){
	gun = instance_create_layer(x-5, y + 10, "Instances", Obj_Gun, {owner: player, scale: 0.75})
	max_ammo = 5;
	armed = true
}

if (teleport_cooldown > 0) {
    teleport_cooldown--;
}
