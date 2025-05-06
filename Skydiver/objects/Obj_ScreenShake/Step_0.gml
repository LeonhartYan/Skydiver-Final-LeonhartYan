if(is_shaking){
	layer_background_blend(layer_background_get_id("Background"), c_black)
	shake_time -=1;
	var x_val = random_range(-shake_magnitude, shake_magnitude);
	var y_val = random_range(-shake_magnitude, shake_magnitude);
	camera_set_view_pos(view_camera[0], Obj_Camera.x + x_val, Obj_Camera.y + y_val)
	
	if(shake_time <= 0){
		shake_magnitude -= shake_fade;
		if(shake_magnitude <= 0){
			layer_background_blend(layer_background_get_id("Background"), make_color_rgb(49, 162, 242))
			camera_set_view_pos(view_camera[0], Obj_Camera.x, Obj_Camera.y);
			is_shaking = false;
			instance_destroy()
		}
	}
}else{
	layer_background_blend(layer_background_get_id("Background"),  make_color_rgb(49, 162, 242))
}
	
