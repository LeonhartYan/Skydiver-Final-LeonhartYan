if (instance_exists(owner)) {
    var offset_x = -5;
    var offset_y = 10;
    x = owner.x + offset_x;
    y = owner.y + offset_y;
    
    var target = noone;
    if (owner == Obj_Player1) {
        if (instance_exists(Obj_Player2)) {
            target = Obj_Player2;
        }
    }
    else if (owner == Obj_Player2) {
        if (instance_exists(Obj_Player1)) {
            target = Obj_Player1;
        }
    }else if (owner == Obj_Sentry) {
		var tag = Obj_Sentry.sentry_target
        if (instance_exists(tag)) {
            target = tag;
        }
    }
    
    if (instance_exists(target)) {
        var ang = point_direction(x, y, target.x, target.y);
        if (ang > 90 && ang <= 270) {
            image_xscale = -scale;
            image_angle = 180 - ang;
        } else {
            image_xscale = scale;
            image_angle = ang;
        }
    }
	if(owner != Obj_Sentry){
		if(owner.reload || owner.fast_reload){
			image_index = 1;
			}else{
			image_index = 0;
		}
		if(owner.respawn){
			instance_destroy()
		}
	}else{
		if(owner.dead){
			instance_destroy()
		}
	}
}

