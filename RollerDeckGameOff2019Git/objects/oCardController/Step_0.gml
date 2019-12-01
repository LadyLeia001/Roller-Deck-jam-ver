fade = lerp( fade, fade_target, 0.1 )
var _list = ds_list_create();

global.fall_timer += (delta_time/100000)

#region undo saveing cards
/*
if ( !has_saved_undo && global.card_held ){
	scr_undo_save()
	
	has_saved_undo = true
} else if (!global.card_held){
	has_saved_undo = false
}*/
#endregion

#region
if( mouse_check_button_pressed(mb_left) && !global.card_held ){
	var obj = collision_circle(mouse_x, mouse_y, 2, oCard, true, true)//click on card
	
	if (obj){
		if(!obj.locked){
			scr_undo_save()
			obj.drag_state  = "Picked_Up"
		}
	}
	ds_list_destroy(_list);
	
	var obj = collision_circle(mouse_x, mouse_y, 2, oCardSpot, true, true)//click on stack to get card
	if (obj){
		if(!obj.locked){
			
		}
	}
	ds_list_destroy(_list);
}
#endregion


global.worldtime += (delta_time/1000000)*60