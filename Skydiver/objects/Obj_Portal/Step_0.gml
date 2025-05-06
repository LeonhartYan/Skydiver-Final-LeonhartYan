if(image_xscale  < 1 || image_yscale < 1){
	image_xscale += 0.1
	image_yscale += 0.1
}

if (instance_exists(other_Door)) {
    var pl = instance_place(x, y, Obj_Player1);
    if (pl != noone) {
		if(pl.teleport_cooldown == 0){
			pl.x = other_Door.x;
			pl.y = other_Door.y;
			pl.teleport_cooldown = 150
		}
    }

   var pl2 = instance_place(x, y, Obj_Player2);
    if (pl2 != noone) {
		if(pl2.teleport_cooldown == 0){
	        pl2.x = other_Door.x;
	        pl2.y = other_Door.y;
	        pl2.teleport_cooldown = 150
		}
    }
	var bullet = instance_place(x, y, Obj_Projectile);
    if (bullet != noone) {
		if(bullet.teleport_cooldown == 0){
	        bullet.x = other_Door.x;
	        bullet.y = other_Door.y;
	        bullet.teleport_cooldown = 150
		}
    }
	var bullet2 = instance_place(x, y, Obj_Projectile_Sentry);
    if (bullet2 != noone) {
		if(bullet2.teleport_cooldown == 0){
	        bullet2.x = other_Door.x;
	        bullet2.y = other_Door.y;
	        bullet2.teleport_cooldown = 150
		}
    }
}

