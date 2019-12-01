#region // make the stack card graphic

var hw = global.card_width*0.5
var hh = global.card_height*0.5

var rs = hw*0.5

var z = 0

if !surface_exists(global.stack_card_gfx)
    {
    global.stack_card_gfx = surface_create(global.card_width, global.card_height+card_thickness);
    surface_set_target(global.stack_card_gfx);
    draw_clear_alpha(c_black, 0);
	for (var sz = -card_thickness; sz < card_thickness; ++sz) {
		var is_back = true
		
		var sindex = sz+1 != card_thickness
		draw_sprite_pos(sCard_Stacked, sindex,
						(-hw)+hw, (-z)-(sz*0.25*is_back)+1,
						( hw)+hw, (-z)-(sz*0.25*is_back)+1,
						( hw)+hw, (-z)-(sz*0.25*is_back)+1+global.card_height,
						(-hw)+hw, (-z)-(sz*0.25*is_back)+1+global.card_height, 1)
	}
	surface_reset_target();
}
#endregion
#region // make the stack card graphic Shadow

var hw = global.card_width*0.5
var hh = global.card_height*0.5

var rs = hw*0.5

var z = 0

if !surface_exists(global.stack_card_shdow_gfx)
    {
    global.stack_card_shdow_gfx = surface_create(global.card_height, global.card_height+global.card_width);
    surface_set_target(global.stack_card_shdow_gfx);
    draw_clear_alpha(c_black, 0);
	for (var sz = -card_thickness*0.25; sz < card_thickness*0.25; ++sz) {
		draw_sprite_pos(sCard_Stacked, 0,
						(-hw)+hw+sz+card_thickness, ((sz+card_thickness)),
						( hw)+hw+sz+card_thickness, ((sz+card_thickness)),
						( hw)+hw+sz+card_thickness, ((sz+card_thickness))+global.card_height,
						(-hw)+hw+sz+card_thickness, ((sz+card_thickness))+global.card_height, 1)
	}
	surface_reset_target();
}
#endregion
