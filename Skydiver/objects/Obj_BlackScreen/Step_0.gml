image_alpha += 0.001;
timer ++;
if(timer > 3 * 60){
	audio_play_sound(GameSet, 10, false);
	audio_play_sound(Impact, 10, false);
	room_goto(Room_End)
}
