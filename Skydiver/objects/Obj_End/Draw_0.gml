draw_set_font(Font1)
draw_set_halign(fa_center)
draw_sprite(Spr_Logo, 0, room_width/2  - 474/2, 104)
draw_text_transformed(room_width/2, 254, "Game Set!", 1.5, 1.5, 0);
draw_text_transformed(room_width/2, 584, "Press SPACE to play again.", 0.65, 0.65, 0);
draw_text_transformed(room_width/2, 704, "2025 Leonhart Yan", 0.6, 0.6, 0);
draw_set_font(Font2)

if(win == Obj_Player2){
	draw_text_transformed(room_width/2, 434, "Skydiver 1 win.", 0.85, 0.85, 0)
	switch (num){
		case 0:
		draw_text_transformed(room_width/2, 354, "### ERROR ### Skydiver 1 Activated an EMP Bomb. Game Runtime error.", 0.85, 0.85, 0)
		break;
		case 1:
		draw_text_transformed(room_width/2, 354, "GAME CRASH DETECTED. Error Code 0x4100_pl4y3r_1_EMP_4ct1vat3d.", 0.85, 0.85, 0)
		break;
		case 2:
		draw_text_transformed(room_width/2, 354, "!!! ERROR !!! Game Unexpectedly Stopped. EMP Activated by Player 1.", 0.85, 0.85, 0)
	}
}else{
	draw_text_transformed(room_width/2, 434, "Skydiver 2 win.", 0.85, 0.85, 0)
	switch (num){
		case 0:
		draw_text_transformed(room_width/2, 354, "### ERROR ### Skydiver 2 Activated an EMP Bomb. Game Runtime error.", 0.85, 0.85, 0)
		break;
		case 1:
		draw_text_transformed(room_width/2, 354, "GAME CRASH DETECTED. Error Code 0x4200_pl4y3r_2_EMP_4ct1vat3d.", 0.85, 0.85, 0)
		break;
		case 2:
		draw_text_transformed(room_width/2, 354, "!!! ERROR !!! Game Unexpectedly Stopped. EMP Activated by Player 2.", 0.85, 0.85, 0)
	}
}
	