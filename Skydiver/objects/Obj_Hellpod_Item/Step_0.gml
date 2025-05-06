y += 30
part_particles_create(part_sys, x, y + 10, par_smoke, irandom_range(2, 5));
if (!created && place_meeting(x, y, Obj_Cloud)) {
    audio_play_sound(Hit, 2, false);
    instance_create_layer(x, y, "Instances", Obj_Sentry, {sentry_target: container, sentry_owner: owner});
	for (var i = 0; i < 10; i++) {
                var star = instance_create_layer(x, y, "Instances", Obj_Star);
                var angle = random_range(180, 360);
                var spd = random_range(10, 18);
                star.hspeed = spd * cos(degtorad(angle));
                star.vspeed = spd * sin(degtorad(angle));
				part_system_destroy(part_sys);
            }
    created = true;
    instance_destroy();
}
if(place_meeting(x, y, Obj_Wall_Collider)){
	audio_play_sound(Hit, 2, false);
    instance_create_layer(x, y - 70, "Instances", Obj_Sentry, {sentry_target: container, sentry_owner: owner});
	for (var i = 0; i < 10; i++) {
                var star = instance_create_layer(x, y, "Instances", Obj_Star);
                var angle = random_range(180, 360);
                var spd = random_range(10, 18);
                star.hspeed = spd * cos(degtorad(angle));
                star.vspeed = spd * sin(degtorad(angle));
				part_system_destroy(part_sys);
            }
    created = true;
    instance_destroy();
}
	