// Create the surface if it doesn't exist.
// For some reason, sometimes surfaces just 'dont exist'.
if !surface_exists(shadows) {
	shadows = surface_create(room_width, room_height);
}
// Don't worry about it :p



// Set the surface as target
surface_set_target(shadows);

// Clear the surface
draw_clear_alpha(c_white, 0);

// Draw shadows from the entity parent
with (oCard) {
	var hw = _card_width*0.5
	var rs = hw*0.5 // side of the card's rotated projection

	var _card_rot_spr = (floor(_card_rot*4)*0.25)+((_card_rot < pi)*pi)

	for (var sz = -card_thickness; sz < card_thickness; ++sz) {
		var is_back = ((_card_rot > pi)-0.5)*2
		if ( !(sz > -card_thickness+1 && sz < card_thickness-1) ){
			image_index = !(_card_rot < pi)*2 //sides of card
		} else {
			image_index = 1
		}
	
		draw_sprite_pos(sprite_index, image_index,
						(-hw*dsin(_card_rot_spr))+x+hw+(0.5*sz*dcos(_card_rot_spr))-(sz-z), (y+z)-(sz*0.25*dsin(_card_rot_spr)*is_back)				 + (  rs*dcos(_card_rot_spr) ),
						( hw*dsin(_card_rot_spr))+x+hw+(0.5*sz*dcos(_card_rot_spr))-(sz-z), (y+z)-(sz*0.25*dsin(_card_rot_spr)*is_back)				 + ( -rs*dcos(_card_rot_spr) ),
						( hw*dsin(_card_rot_spr))+x+hw+(0.5*sz*dcos(_card_rot_spr))-(sz-z), (y+z)-(sz*0.25*dsin(_card_rot_spr)*is_back)+_card_height + ( -rs*dcos(_card_rot_spr) ),
						(-hw*dsin(_card_rot_spr))+x+hw+(0.5*sz*dcos(_card_rot_spr))-(sz-z), (y+z)-(sz*0.25*dsin(_card_rot_spr)*is_back)+_card_height + (  rs*dcos(_card_rot_spr) ),1)
	}
}

with (oCardSpot) {
	for (var i = 0; i < ds_list_size(cards); ++i) {
	    draw_surface(global.stack_card_shdow_gfx,start_x+((i-1)*card_thickness*1), start_y+((i-1)*card_thickness*1))
	}
}

with (pTitleButton) {
	for (var i = 1; i < thickness; ++i) {
		draw_sprite_ext(sprite_index, 0, x+(z+i), y+(z+i), image_xscale, image_yscale, image_angle, c_black, image_alpha);
	}
}

with (oTitleCard) {
	for (var i = 1; i < card_thickness; ++i) {
		draw_sprite_ext(sprite_index, 0, x+(z+i), y+(z+i), image_xscale, image_yscale, image_angle, c_black, image_alpha);
	}
}

with (oMouse) {
	for (var i = 1; i < thickness; ++i) {
		draw_sprite_ext( sMouseHand, _spr, mouse_x+(i), mouse_y-(z+i), 1, 1, image_angle, c_black, 0.25 );
	}
}

surface_reset_target();


// Then draw the surface to the screen
// (you change the alpha here)
draw_surface_ext(shadows, 0, 0, 1, 1, 0, c_black, shadow_alpha);
