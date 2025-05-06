initial_speed = 10; 
speed = initial_speed;
teleport_cooldown = 0;
if(proj_target != noone){
	direction = point_direction(x, y, proj_target.x, proj_target.y);
}
turn_speed = 15;
homing_threshold = 30
acceleration = 0.3;
homing = false;
image_angle = direction;
randomize()

part_sys = part_system_create();

par_trail = part_type_create();

part_type_shape(par_trail, pt_shape_flare);
part_type_size(par_trail,0.3, 0.7, 0, 0);
part_type_color3(par_trail, make_color_rgb(76, 0, 0), c_red, make_color_rgb(255, 178, 178)); 
part_type_alpha3(par_trail, 0.8, 0.5, 0); 
part_type_life(par_trail, 6, 10); 
part_type_speed(par_trail, 2, 5, 0, 1); 
part_type_direction(par_trail, 85, 95, 5, 0); 
