ps = part_system_create();
depth = -999
par_flame = part_type_create();
part_type_sprite(par_flame,Spr_CloudExp,0,0,1);
part_type_size(par_flame,0.5,1.5,-0.05,0);
part_type_orientation(par_flame,0,360,2,0,0);
part_type_color2(par_flame,c_orange,c_red);
part_type_alpha3(par_flame,1,1,0);
part_type_blend(par_flame,0);
//part_type_life(par_flame, 1, 3);
part_type_life(par_flame, 30, 60);
part_type_direction(par_flame,85,95,0,0);
part_type_speed(par_flame,2,10,-.1,0);

life_time   = 60 * 20;
part_system_depth(ps, depth);
emitter = part_emitter_create(ps);
part_emitter_region(ps, emitter,
    x, x, y, y,
    ps_shape_ellipse, ps_distr_linear
);

part_emitter_stream(ps, emitter, par_flame, 20);


