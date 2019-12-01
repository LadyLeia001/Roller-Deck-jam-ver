#region pause button
if (!pause){
	instance_activate_all()
	
	if (position_meeting(mouse_x, mouse_y, id)){
		if( mouse_check_button_pressed(mb_left) ){ // pressed left mouse button
			audio_play_sound(sClick, 10, false);
			pause = true
			//global.fall_timer = 4.51
			fade_target = 0.25
			instance_deactivate_all(true)
			instance_activate_object(oMouse)
		}
	}
}else{
	var menu_length = array_length_1d(menu)
	for (var i = 0; i < menu_length; ++i) {
		if( !instance_exists(menu[i]) ){
			var _y = (i-(menu_length*0.5))*64
			instance_create_depth((room_width/2), (room_height/2)+_y, depth-1, menu[i])
		}
	}
}
#endregion

#region menu stuff
fade = lerp(fade,fade_target,0.2)
#endregion