
draw_set_color(argument4)
for (var i = 0; i < argument3; ++i) {
	draw_set_alpha(i/argument3)
    draw_text_transformed(argument0, argument1-i, argument2,argument5,argument5,image_angle)
}
draw_set_alpha(1)
