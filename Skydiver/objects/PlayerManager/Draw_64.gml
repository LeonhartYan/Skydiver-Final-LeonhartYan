draw_set_font(Font1);
draw_set_halign(fa_left)
draw_text_color(25, 25, global.ply2point, c_yellow, c_yellow, make_color_rgb(255, 209, 45), c_white,1)
draw_text_transformed_color(25, 85, "$"+ string(global.ply2coin), 0.75, 0.75, 0,c_white, c_white, c_white, c_white,1)
draw_set_halign(fa_right)
draw_text_color(1376 - 25, 25, global.ply1point, c_red, c_red, c_black, c_white, 1)
draw_text_transformed_color(1376- 25, 85,"$" + string(global.ply1coin), 0.75, 0.75, 0,c_white, c_white, c_white, c_white,1)
var maxShake = 5; 
var mult2 = clamp(global.ply2mult, 1, 4);
var amp2 = ((mult2 - 1) / 3) * maxShake;
var dx2 = random_range(-amp2, amp2);
var dy2 = random_range(-amp2, amp2);
draw_set_font(Font1);
draw_set_halign(fa_left);
draw_text_transformed_color(25 + dx2, 135+ dy2, "X"+ string(mult2), 0.65, 0.65, 0,c_yellow, c_yellow,c_yellow, c_yellow,1)

var mult1 = clamp(global.ply1mult, 1, 4);
var amp1  = ((mult1 - 1) / 3) * maxShake;
var dx1   = random_range(-amp1, amp1);
var dy1   = random_range(-amp1, amp1);
draw_set_halign(fa_right);
draw_text_transformed_color(1376 - 25 - dx1, 135 - dy1, "X"+ string(mult1), 0.65, 0.65, 0,c_red, c_red,c_red, c_red,1)
draw_set_halign(fa_center)
if(global.testmode){
	draw_text_transformed_color(room_width/2, 25,"Test Mode",0.45, 0.45, 0,c_white, c_white, c_white, c_white,global.alp);
}
draw_set_font(Font2);
draw_set_colour(c_white);
var text;
var shadow;
var text_x = 1376/2;
var text_y = 700;
if(audio_is_playing(launch)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Skydiver, launch!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Skydiver, launch!" )
}else if(audio_is_playing(reinforced)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Skydiver, reinforced!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Skydiver, reinforced!" )
}else if(audio_is_playing(ontarget)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Right on target.", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Right on target." )
}else if(audio_is_playing(justice)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Justice never sleep!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Justice never sleep!" )
}else if(audio_is_playing(muppet)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "How the muppet like you pass selection!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "How the muppet like you pass selection!" )
}else if(audio_is_playing(GG)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Git Gud!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Git Gud!" )
}else if(audio_is_playing(firemission)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Requesting on fire mission.", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Requesting on fire mission." )
}else if(audio_is_playing(reqreinf)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Requesting for reinforcement!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Requesting for reinforcement!" )
}else if(audio_is_playing(Orbital)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Orbital Strike inbound!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Orbital Strike inbound!" )
}else if(audio_is_playing(DGetBurn)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Don't get burn!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Don't get burn!" )
}else if(audio_is_playing(EMPAc)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Activating EMP!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Activating EMP!" )
}else if(audio_is_playing(SupArms)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Calling for supporting arms!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Calling for supporting arms!" )
}else if(audio_is_playing(Sentry)){
	shadow = draw_text_color(text_x + 2, text_y + 3, "Requesting sentry!", c_black, c_black, c_black, c_black, 0.5)
	text = draw_text(text_x, text_y, "Requesting sentry!" )
}