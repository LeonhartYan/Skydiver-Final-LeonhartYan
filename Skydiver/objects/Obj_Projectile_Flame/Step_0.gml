part_particles_create(part_sys, x, y, par_trail, irandom_range(2, 5));
   
y += 10;
if (!flame_spawned && place_meeting(x, y, Obj_Cloud)) {
	 for (var i = 0; i < 10; i++) {
                var star = instance_create_layer(x, y, "Instances", Obj_Star);
                var ang = random_range(0, 360);
                var spd = random_range(-16, -8);
                star.hspeed = spd * cos(degtorad(ang));
                star.vspeed = spd * sin(degtorad(ang));
            }
    var cld = instance_place(x, y, Obj_Cloud);
    var count   = cld.level + 1;
    var cloud_w = sprite_get_width(cld.sprite_index);
    var spacing = cloud_w / count;
    for (var i = 0; i < count; i++) {
        var fx = cld.x - cloud_w*0.5 + spacing*(i + 0.5);
        var fy = cld.y;
        var flame = instance_create_layer(fx, fy, "Instances", Obj_Flame, {flame_target: target, flame_owner: owner});
    }

	part_system_destroy(part_sys)
    flame_spawned = true;
    instance_destroy();
    exit;
}

if (place_meeting(x, y, Obj_Ground) || x < 0 || x > 1376 || y > 1500) {
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