y += 10
if(!play){
audio_play_sound(load, 10, false);
play = true;
}
part_particles_create(part_sys, x, y + 10, par_smoke, irandom_range(2, 5));
Obj_Camera.is_small_shaking = true;
if(place_meeting(x, y, Obj_Wall_Collider)){
	if(!play1){
	audio_play_sound(EMPBmm, 3, false);
	play1 = true;
	}
		y = room_height - 30
		instance_create_layer(room_width/2,room_height/2, "Instances", Obj_BlackScreen)
}
