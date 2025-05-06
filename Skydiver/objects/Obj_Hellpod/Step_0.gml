y += 30
part_particles_create(part_sys, x, y + 10, par_smoke, irandom_range(2, 5));
if(place_meeting(x, y, Obj_Wall_Collider)){
		y = room_height - 30
		}
if(container == Obj_Player1 || container == Obj_Player2){
	if(place_meeting(x, y, Obj_Wall_Collider)){
		y = room_height - 30
	if(!created){
		Obj_Camera.is_small_shaking = true;
		audio_play_sound(Hellpod, 3, false)
		for (var i = 0; i < 20; i++) {
                var star = instance_create_layer(x, y, "Instances", Obj_Smoke);
                var angle = random_range(180, 360);
                var spd = random_range(10, 18);
                star.hspeed = spd * cos(degtorad(angle));
                star.vspeed = spd * sin(degtorad(angle));
            }
		newplayer = instance_create_layer(x, y, "Instances", container)
		if(!global.first && !Obj_Ship.shooting_mode){
			var word = irandom(3)
				
				switch(word){
					case 0:
					audio_play_sound(reinforced, 2, false)
					break;
					case 1:
					audio_play_sound(justice, 2, false)
					break;
					case 2:
					audio_play_sound(reqreinf, 2, false)
					break;
				}
		}
		created = true
	}
	if(created){
	life--
	particle_life --}
	if(particle_life <= 0){
		part_type_clear(par_smoke);
		particle_life = 0;
	}
	if(life <= 0 && newplayer != noone){
		for (var i = 0; i < 10; i++) {
                var star = instance_create_layer(x, y, "Instances", Obj_Star);
                var angle = random_range(180, 360);
                var spd = random_range(10, 18);
                star.hspeed = spd * cos(degtorad(angle));
                star.vspeed = spd * sin(degtorad(angle));
				part_system_destroy(part_sys);
            }
		instance_destroy()
	}
	}
}
