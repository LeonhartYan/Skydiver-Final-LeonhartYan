if (!reload && !fast_reload) {
    for (var i = 0; i < ammo; i++) {
		if(player == Obj_Player2){
			draw_sprite_ext(Spr_Ammo, 0, player.x - 70 + i * (sprite_get_width(Spr_Ammo) + 15), player.y - 100, 1, 1, 0, c_yellow, 1);
		}else if(player == Obj_Player1){
			draw_sprite_ext(Spr_Ammo, 0, player.x - 70 + i * (sprite_get_width(Spr_Ammo) + 15), player.y - 100, 1, 1, 0, c_red, 1);
		}
    }
} else {
    draw_set_colour(c_white);
    draw_set_font(Font1);
	draw_set_halign(fa_right)
	draw_text_transformed_color(player.x + 71, player.y - 91, "Reloading", 0.4, 0.4, 0, c_black, c_black, c_black, c_black, 0.5);
	draw_text_transformed(player.x + 70, player.y - 93, "Reloading", 0.4, 0.4, 0);
}
if(global.show){
	draw_set_colour(c_white);
	draw_set_font(Font1);
	draw_set_halign(fa_right)
	if(player == Obj_Player1){
		draw_text_transformed_color(player.x - 99, player.y - 98, "P2", 0.75, 0.75, 0, c_black, c_black, c_black, c_black, 0.5);
		draw_text_transformed(player.x - 100, player.y - 100, "P2", 0.75, 0.75, 0);
	}else if(player == Obj_Player2){
		draw_text_transformed_color(player.x - 99, player.y - 98, "P1", 0.75, 0.75, 0, c_black, c_black, c_black, c_black, 0.5);
		draw_text_transformed(player.x - 100, player.y - 100, "P1", 0.75, 0.75, 0);
	}
}