global.clouds = ds_list_create()
global.start = false
global.collisionTriggered = false;
global.collisionTimer = 0;
global.collisionDuration = 30
global.cam_target_x = room_width/2;
global.cam_target_y = 0
global.ply1point = 0;
global.ply1coin = 0;
global.ply2point = 0;
global.ply2coin = 0;
global.first = true;
global.show = false;
global.p1cost = 3;
global.p2cost = 3;
global.alp = 0;
global.portalA = noone;
global.portalB = noone;
global.winner = noone;
global.ply1sentry = false;
global.ply2sentry = false;
global.testmode = false;
global.cost_list1 = [5, 5, 5, 5, 45];
global.cost_list2 = [5, 5, 5, 5, 45];
global.ply1mult = 1;
global.ply2mult = 1;
game_set_speed(60, gamespeed_fps);
audio_stop_sound(BGM)