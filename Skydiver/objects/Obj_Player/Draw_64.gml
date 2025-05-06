var ui_x = 130;
var ui_y = 25;
var row_h     = 80;   
var arrow_sp  = 60;   
var base_cost = global.cost_list1;
var playerCoins = global.ply1coin;
var playerPoint = global.ply1point

if (type == 2) {
    ui_x = 230;
    ui_y = 25;
    base_cost = global.cost_list2;
    playerCoins = global.ply2coin;
	playerPoint = global.ply2point
}
else if (type == 1) {
    ui_x = room_width - 470;
    ui_y = 25;
    base_cost = global.cost_list1;
    playerCoins = global.ply1coin;
	playerPoint = global.ply1point
}

if (strata) {
    for (var r = 0; r < array_length(cmd_list); r++) {
        var yy        = ui_y + r * row_h;
        var preset    = cmd_list[r];
        var plen      = string_length(preset);
        var in_len    = string_length(command_input);
        var is_prefix = (in_len > 0) && (string_pos(command_input, preset) == 1);

        for (var i = 0; i < plen; i++) {
            var ch    = string_char_at(preset, i+1);
            var frame = 0;
            if (ch == "W") frame = 0;
            else if (ch == "A") frame = 1;
            else if (ch == "S") frame = 2;
            else if (ch == "D") frame = 3;

            var col = c_white;
            if (is_prefix && i < in_len && string_char_at(command_input, i+1) == ch) {
                col = make_color_rgb(255,255,0);
            }

            draw_sprite_ext(Spr_arrow, frame, ui_x + i * arrow_sp, yy, 0.75, 0.75, 0, col, 1);
        }

        draw_set_font(Font1);
        draw_set_halign(fa_center);
        var cost_txt = string(base_cost[r]);
		if(r != 4){
			draw_text_transformed(ui_x + 125, yy + 60,name_list[r] + ":" + cost_txt + " Coins",0.4, 0.4, 0);
		}else{
			draw_text_transformed(ui_x + 125, yy + 60,name_list[r] + ":" + cost_txt + " pts",0.4, 0.4, 0);
		}
    }
}
else {
    draw_set_font(Font1);
    draw_set_halign(fa_center);

    for (var r = 0; r < array_length(cmd_list); r++) {
        var yy   = ui_y + r * row_h/2;
        var cost = base_cost[r];
        var enough = (playerCoins >= cost);
		if(r == 3){
			if (type == 1 && global.ply1sentry || type==2 && global.ply2sentry) {
			 continue;
		 }
		}
		 if (r == 4) {
            if (playerPoint >= cost) {
                enough = true;
            } else {
                enough = false;
            }
        }
        if (enough && !Obj_Ship.shooting_mode && !Obj_Ship.fire_mode &&!instance_exists(Obj_Flame)) {
            var title = name_list[r];
            if (type == 1) title += " (<)";
            else           title += " (X)";

            draw_text_transformed_color(ui_x + 100, yy,title,0.45, 0.45, 0,c_white, c_white, c_white, c_white,global.alp);
        }
    }
}
