
if (position_meeting(mouse_x, mouse_y, id)){
	if( mouse_check_button_pressed(mb_left) ){ // pressed left mouse button
		image_index = 1
	}
	if( mouse_check_button_released(mb_left) ){ // pressed left mouse button
		audio_play_sound(sClick, 10, false);
		room_restart()
	}
}else{
	image_index = 0
}
	