
draw_sprite(sprite_index, image_index, x, y);

for (var i = 1; i < hight; ++i) {
	draw_surface(global.stack_card_gfx, x, y-(i*(card_thickness*0.5)) )
}
