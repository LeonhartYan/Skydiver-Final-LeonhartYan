life = 450
particle_life = 60
created = false;
newplayer = noone;
depth = Obj_Ground.depth - 10
randomize()
part_sys = part_system_create();

par_smoke = part_type_create();

part_type_shape(par_smoke, pt_shape_cloud);
part_type_size(par_smoke, 0.8, 1, 0, 0);
part_type_color3(par_smoke, c_white, make_color_rgb(255, 184, 109),c_red); 
part_type_alpha3(par_smoke, 0.8, 0.6, 0); 
part_type_life(par_smoke, 60, 80); 
part_type_speed(par_smoke, 2, 5, 0, 0); 
part_type_direction(par_smoke, 85, 95, 0, 5); 
part_type_gravity(par_smoke, -0.05, 270); 
part_type_blend(par_smoke, true); 