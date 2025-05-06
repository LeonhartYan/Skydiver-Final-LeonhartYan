var new_target_x = room_width / 2;
var new_target_y = 0;

if (global.start) {
    if (instance_exists(Obj_Player1) && instance_exists(Obj_Player2)) {
        new_target_x = (Obj_Player1.x + Obj_Player2.x) * 0.5;
        new_target_y = (Obj_Player1.y + Obj_Player2.y) * 0.5;
    }
    else if (instance_exists(Obj_Player1) && instance_exists(Obj_Hellpod)) {
        var hell = instance_find(Obj_Hellpod, 0);
        var offset = 50;
        var weight_player = 0.8;
        var weight_hell = 1 - weight_player;
        new_target_x = (hell.x + Obj_Player1.x) * 0.5;
        new_target_y = (Obj_Player1.y * weight_player + (hell.y - offset) * weight_hell);
    }
    else if (instance_exists(Obj_Player2) && instance_exists(Obj_Hellpod)) {
        var hell = instance_find(Obj_Hellpod, 0);
        var offset = 50;
        var weight_player = 0.8;
        var weight_hell = 1 - weight_player;
        new_target_x = (hell.x + Obj_Player2.x) * 0.5;
        new_target_y = (Obj_Player2.y * weight_player + (hell.y - offset) * weight_hell);
    }
    else if (instance_exists(Obj_Player1)) {
        new_target_x = Obj_Player1.x;
        new_target_y = Obj_Player1.y;
    }
    else if (instance_exists(Obj_Player2)) {
        new_target_x = Obj_Player2.x;
        new_target_y = Obj_Player2.y;
    }
} else {
    new_target_x = room_width / 2;
    new_target_y = 0;
}


var smooth_factor = 0.1;
global.cam_target_x = lerp(global.cam_target_x, new_target_x, smooth_factor);
global.cam_target_y = lerp(global.cam_target_y, new_target_y, smooth_factor);

var ply_x = global.cam_target_x;
var ply_y = global.cam_target_y;

var view_w = OG_view_width * focusZoom;
var view_h = OG_view_height * focusZoom;
var lerp_spd = 0.55;
var current_cam_x = camera_get_view_x(view_camera[0]);
var current_cam_y = camera_get_view_y(view_camera[0]);
var target_cam_x = ply_x - view_w * 0.5;
var target_cam_y = ply_y - view_h * 0.5;
target_cam_x = clamp(target_cam_x, 0, room_width - view_w);
target_cam_y = clamp(target_cam_y, 0, room_height - view_h);
var cam_x = lerp(current_cam_x, target_cam_x, lerp_spd);
var cam_y = lerp(current_cam_y, target_cam_y, lerp_spd);
cam_x = clamp(cam_x, 0, room_width - view_w);
cam_y = clamp(cam_y, 0, room_height - view_h);
camera_set_view_pos(view_camera[0], cam_x, cam_y);
camera_set_view_size(view_camera[0], view_w, view_h);

game_set_speed(current_gmspeed, gamespeed_fps);

if (focus && instance_exists(Obj_Player1) && instance_exists(Obj_Player2)) {
    focusZoom -= lerp(0.01, 0.05, 0.01);
    current_gmspeed -= 2;
    if (focusZoom <= 0.7) {
        focusZoom = 0.7;
    }
    if (current_gmspeed <= normal_speed * 0.6) {
        current_gmspeed = normal_speed * 0.6;
        Obj_Player1.image_speed = 0;
        Obj_Player2.image_speed = 0;
    }
    focus_time -= 1;
    if (focus_time <= 0) {
        focus = false;
        focus_time = 45;
    }
} else {
    if (focusZoom < 1.0) {
        focusZoom += 0.05;
    }
    if (current_gmspeed < normal_speed) {
        current_gmspeed += 2;
    }
}

var view_width = OG_view_width * focusZoom;
var view_height = OG_view_height * focusZoom;

if (cam_x < 0) {
    cam_x = 0;
}
if (cam_x + view_width > room_width) {
    cam_x = room_width - view_width;
}
if (cam_y < 0) {
    cam_y = 0;
}
if (cam_y + view_height > room_height) {
    cam_y = room_height - view_height;
}

camera_set_view_pos(view_camera[0], cam_x, cam_y);
camera_set_view_size(view_camera[0], view_width, view_height);

if (is_shaking) {
    layer_background_blend(layer_background_get_id("Background"), c_black);
    shake_time -= 1;
    var x_val = random_range(-shake_magnitude, shake_magnitude);
    var y_val = random_range(-shake_magnitude, shake_magnitude);
    camera_set_view_pos(view_camera[0], cam_x + x_val, cam_y + y_val);
    
    if (shake_time <= 0) {
        shake_magnitude -= shake_fade;
        if (shake_magnitude <= 0) {
            layer_background_blend(layer_background_get_id("Background"), make_color_rgb(239, 169, 95));
            camera_set_view_pos(view_camera[0], cam_x, cam_y);
            shake_magnitude = 30;
            shake_time = 2;
            is_shaking = false;
        }
    }
} else if (is_small_shaking) {
    shake_time -= 1;
    var x_val = random_range(-small_magnitude, small_magnitude);
    var y_val = random_range(-small_magnitude, small_magnitude);
    camera_set_view_pos(view_camera[0], cam_x + x_val, cam_y + y_val);
    
    if (shake_time <= 0) {
        small_magnitude -= shake_fade;
        if (small_magnitude <= 0) {
            layer_background_blend(layer_background_get_id("Background"), make_color_rgb(239, 169, 95));
            camera_set_view_pos(view_camera[0], cam_x, cam_y);
            small_magnitude = 20;
            shake_time = 2;
            is_small_shaking = false;
        }
    }
 
}else {
    camera_set_view_pos(view_camera[0], cam_x, cam_y);
    layer_background_blend(layer_background_get_id("Background"), make_color_rgb(239, 169, 95));
}

//show_debug_message(focusZoom);
