for (var i = 1; i < card_thickness; ++i) {
	draw_sprite_ext(sprite_index, 1, x, (y-card_thickness)-(z-i), image_xscale, image_yscale, image_angle, c_gray, image_alpha);
}
draw_sprite_ext(sprite_index, 0, x, (y-card_thickness)-(z), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
