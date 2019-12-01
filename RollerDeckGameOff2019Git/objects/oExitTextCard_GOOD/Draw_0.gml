

for (var i = 1; i < 5; ++i) {
	draw_sprite_ext(sprite_index, 1, x, (y-5)-(z-i), image_xscale, image_yscale, image_angle, c_gray, image_alpha);
}
draw_sprite_ext(sprite_index, 0, x, (y-5)-(z), image_xscale, image_yscale, image_angle, image_blend, image_alpha);


draw_set_font(m6x11)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_text_stack(x, ((y-5)-(z)),TEXT,4, c_white,3)
