
var _thickness = thickness*scale

for (var z = 0; z < thickness; ++z) {
	var col = make_colour_hsv(100, 0, (z/thickness)*255 )
	for (var i = 0; i < num_of_parts; ++i) {
		draw_sprite_ext(sLogo,i,x+(part_offset_x[i]*scale),(y-z)+y_off+((i-(num_of_parts*0.5))*spaceing*scale), scale, scale, 0, col, z/thickness );
	}
}


draw_set_font(bit_wonder)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_text_stack(room_width*0.5, text_offset_y+y+y_off+((i-(num_of_parts*0.5))*spaceing*scale),"AlterMedia",_thickness*0.5, c_white,scale*2)