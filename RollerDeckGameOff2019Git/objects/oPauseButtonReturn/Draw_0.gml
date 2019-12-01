
//draw_rectangle_color(0,0,100,100,c_green,c_green,c_green,c_green,false)
draw_text(16,16,global.fall_timer)
draw_text(16,32,my_time)

// Inherit the parent event
event_inherited();

draw_set_font(m6x11)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_text_stack(x, ((y-thickness)-(z)),"Return",4, c_white,2)
