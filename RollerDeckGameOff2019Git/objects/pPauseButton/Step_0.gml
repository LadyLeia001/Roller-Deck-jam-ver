if(menu_pressed){
	my_time += (delta_time/100000)*global.fall_timer_mult
}

if(global.fall_timer > fall_timer_max){
	if(z+zv < ground && sign(global.zg) == -1 ){
		zv = -zv*zf
	} else {
		zv +=global.zg//*0.25
		z+=zv
	}
}
if(my_time > 10 && menu_pressed){
	/*if(room_target != noone){
		//show_message( room_get_name(room_target) + "   " + object_get_name(object_index))
		room_goto(room_target)
	}*/
	event_user(0)
}

if(position_meeting(mouse_x, mouse_y, id) && z < ground+5){
	if(mouse_check_button_pressed(mb_left)){
		if(room_target != noone){
			audio_play_sound(sClick, 10, false);
		
			zv -=global.zg*10
			global.zg = 1
			global.fall_timer = 0
			my_time =0
			global.fall_timer_mult = 2
			menu_pressed = true
			audio_sound_gain(mIntoTitle, 0, 2.5*1000);
		} else {
			zv -=global.zg*10
		}
	}
	z=4
	zv -=global.zg
}

depth = (((-z*2)+-y)*0.01)+-50