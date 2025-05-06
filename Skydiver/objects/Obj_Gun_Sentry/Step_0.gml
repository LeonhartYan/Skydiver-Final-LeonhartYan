if (instance_exists(owner)) {
    if(owner != Obj_Sentry){
		var offset_x = -5;
		var offset_y = 10;
		x = owner.x + offset_x;
		y = owner.y + offset_y;
	}
    
    if (instance_exists(target)) {
        var ang = point_direction(x, y, target.x, target.y);
        if (ang > 90 && ang <= 270) {
            image_xscale = -1;
            image_angle = 180 - ang;
        } else {
            image_xscale = 1;
            image_angle = ang;
        }
    }
	if(owner.respawn){
			instance_destroy()
		}
}