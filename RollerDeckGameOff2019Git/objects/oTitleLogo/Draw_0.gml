
// Inherit the parent event

var t = global.fall_timer*0.02
for (var i = 1; i < thickness; ++i) {
	draw_sprite_ext(sprite_index, 1, x, (y-thickness)-(z-i), image_xscale, image_yscale, image_angle, c_gray, image_alpha);
	//draw_sprite_wave(sprite_index, 1, x, (y-thickness)-(z-i),0,100,10,t)
}
draw_sprite_ext(sprite_index, 0, x, (y-thickness)-(z), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
//draw_sprite_wave(    sprite_index, 0, x, (y-thickness)-(z  ),0,100,10,t)



draw_set_font(bit_wonder)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_text_stack(x+(sprite_width*0.5), ((y-thickness)-(z))+(sprite_height*0.5)-12.5,"Roller Deck",4, c_white,1.5)
