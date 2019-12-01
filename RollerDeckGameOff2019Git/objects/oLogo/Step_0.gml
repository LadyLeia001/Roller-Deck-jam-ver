timer += delta_time/100000

if(anim_part = 0){
	if(scale < 0.95){
		scale = lerp(scale, 1, 0.02) //do scaleing
		y_off = lerp(y_off, 10, 0.02)
		text_offset_y = lerp(text_offset_y, -40, 0.02)
	}else{
		scale = 1
		if(spaceing < 65){
			spaceing = lerp(spaceing, 70, 0.06)
		}else{
			spaceing = 68
			part_offset_x[0] = lerp(part_offset_x[0], -10, 0.010*2)
			part_offset_x[1] = lerp(part_offset_x[1],  15, 0.015*2)
			part_offset_x[2] = lerp(part_offset_x[2], -20, 0.020*2)
			part_offset_x[3] = lerp(part_offset_x[3],  25, 0.025*2)
			part_offset_x[4] = lerp(part_offset_x[4], -30, 0.030*2)
			
			if(part_offset_x[0] < -9){
				anim_part = 1
			}
		}
	}
} else if (anim_part == 1){
	scale = lerp(scale, 100, 0.01) //do scaleing
	if(scale > 20){
		oTitleController.fade_target = 1
	}
	if(scale > 70){
		instance_activate_all()
		window_set_cursor(cr_none);
		oTitleController.fade_target = 0
		oTitleController.bg_col = make_color_rgb(232, 27, 16)
		oTitleController.is_menu = true
		instance_destroy()
	}
}

/*
spaceing = lerp(spaceing, spaceing_target, 0.1)
scale    = lerp(scale,    scale_target,    0.1)
*/


