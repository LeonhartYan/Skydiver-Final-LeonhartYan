if (!global.start) {
	if(!audio){
		audio_play_sound(load, 2, false)
		audio = true;
	}
    resp_timer++;
    if (resp_timer == resp_duration) {
		audio_play_sound(BGM, 5, true)
		audio_play_sound(Respawn, 3, false)
        var pos1 = irandom_range(100, 1300);
        var pos2 = irandom_range(100, 1300);
        while (pos1 == pos2) {
            pos2 = irandom_range(100, 1300);
        }
        var player1 = instance_create_layer(pos1, 190, "Instances", Obj_Hellpod, {container: Obj_Player1});
        var player2 = instance_create_layer(pos2, 190, "Instances", Obj_Hellpod, {container: Obj_Player2 });
        global.start = true;
		audio_play_sound(launch, 2, false)
        resp_timer = 0;
    }
}
if (global.collisionTriggered) {
	global.collisionTimer ++;
	if (global.collisionTimer >= global.collisionDuration) {
		global.collisionTriggered = false;
		global.collisionTimer = 0;
		}
}

if(global.first){
	global.show = true;
}
if (global.show) {
    show_timer++;
    if (show_timer >= show_duration) {
        global.show = false;
        show_timer = 0;
    }
}

if (increasing) {
    global.alp += 0.05;
    if (global.alp >= 1) {
        global.alp = 1;
        increasing = false;
    }
} else {
    global.alp -= 0.05;
    if (global.alp  <= 0) {
        global.alp = 0;
        increasing = true;
    }
}

if(global.ply1mult > 4){
	global.ply1mult = 4;
}
if(global.ply2mult > 4){
	global.ply2mult = 4;
}