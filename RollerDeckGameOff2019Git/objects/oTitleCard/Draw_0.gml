
#region // card face
if !surface_exists(card_surf){
	card_surf = surface_create(global.card_width, global.card_height);
	surface_set_target(card_surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}

surface_set_target(card_surf);
draw_clear_alpha(c_black, 0);

draw_sprite_ext(sCard_base,		0,			0,0,1,1,0,col_Border,	1)
//draw_sprite_ext(sCard_Numbers,	Value,		0,0,1,1,0,col_Num,		1)
draw_set_font(m6x11)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
//draw_text(global.card_width*0.5, global.card_height*0.5,Value )
draw_text_ext_transformed(global.card_width*0.5, (global.card_height*0.5)-8, (Value), 10, 300, 2, 2, 0);
//draw_text_stack(_card_width*0.5, _card_height*0.5,"x2",4, col_Num,1)
draw_sprite_ext(sCard_Types,	Operation,	0,0,1,1,0,col_Operation,1)
surface_reset_target();

#endregion

//draw_surface(card_surf, x+(global.card_width*0.5) , y+(global.card_height*0.5) )

var hw = global.card_width *0.5
var hh = global.card_height*0.5
var tex = surface_get_texture(card_surf);

for (var i = 1; i < card_thickness; ++i) {
	draw_primitive_begin_texture(pr_trianglestrip, tex);
	draw_vertex_texture(x+point_rot_2d_x(-hw, hh,-image_angle), y+(z-i)+point_rot_2d_y(-hw, hh,-image_angle), 1, 0);
	draw_vertex_texture(x+point_rot_2d_x( hw, hh,-image_angle), y+(z-i)+point_rot_2d_y( hw, hh,-image_angle), 0, 0);
	draw_vertex_texture(x+point_rot_2d_x(-hw,-hh,-image_angle), y+(z-i)+point_rot_2d_y(-hw,-hh,-image_angle), 1, 1);
	draw_vertex_texture(x+point_rot_2d_x( hw,-hh,-image_angle), y+(z-i)+point_rot_2d_y( hw,-hh,-image_angle), 0, 1); 
	draw_primitive_end();
}
image_angle = image_angle%360






