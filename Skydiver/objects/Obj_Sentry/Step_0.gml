lifetime -= 1;
if(!gen){
	gun = instance_create_layer(x-5, y + 10, "Instances", Obj_Gun_Sentry, {owner: Obj_Sentry, target: sentry_target})
	gen = true;
}
if (lifetime <= 0) {
	dead = true;
   for (var i = 0; i < 10; i++) {
        var star = instance_create_layer(x, y, "Instances", Obj_Star);
        var angle = random_range(180, 360);
        var spd = random_range(10, 18);
        star.hspeed = spd * cos(degtorad(angle));
        star.vspeed = spd * sin(degtorad(angle));
    }
	if(sentry_owner == Obj_Player1){
		global.ply1sentry = false;
	} else if(sentry_owner == Obj_Player2){
		global.ply2sentry = false;
	}
	instance_destroy(gun);
    instance_destroy();
    exit;
}
if (instance_exists(sentry_target)) {
	if (fire_cooldown <= 0) {
	    var bullet = instance_create_layer(
	        x, y, "Instances", Obj_Projectile_Sentry, 
	        { proj_target: sentry_target, owner: sentry_owner }
	    );
	    fire_cooldown = fire_rate;
	} else {
	    fire_cooldown -= 1;
	}
}
