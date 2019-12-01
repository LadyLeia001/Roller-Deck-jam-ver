
// Inherit the parent event
event_inherited();

draw_set_font(m6x11)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_text_stack(x+point_rot_2d_x(0,4,image_angle), ((y-thickness)-(z))+point_rot_2d_y(0,4,image_angle),TEXT,4, c_white,2)
