if (window_get_cursor() == cr_none){
	_spr = mouse_check_button(mb_left)
	//draw_sprite_ext( sMouseHand, _spr, mouse_x, mouse_y, 1, 1, 0, c_white, 1 );
	for (var i = 1; i < thickness; ++i) {
		draw_sprite_ext( sMouseHand, _spr, mouse_x, mouse_y-(i), 1, 1, 0, c_white, 1 );
	}
}




