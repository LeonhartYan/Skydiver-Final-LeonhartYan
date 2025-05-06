persistent = true;
if (!variable_global_exists("global.dust_system")) {
    global.dust_system = part_system_create();
    part_system_depth(global.dust_system,-9);
}

dust_par = part_type_create();
part_type_shape(dust_par, pt_shape_pixel);
part_type_size(dust_par, 5, 10, 0, 0);
part_type_color1(dust_par, make_color_rgb(229, 117 ,0));
part_type_alpha1(dust_par, 0.75);
part_type_life(dust_par, 100, 1300);
part_type_speed(dust_par, 10, 30, 0.5, 5); 
part_type_direction(dust_par, 0, -30, 0, 0);
part_type_gravity(dust_par, 0, 0);

dust_emitter = part_emitter_create(global.dust_system);
part_emitter_region(global.dust_system, dust_emitter, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);

