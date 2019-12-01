
var hw = _card_width*0.5
var rs = hw*0.5 // side of the card's rotated projection

var _card_rot_spr = _card_rot//(floor(_card_rot*4)*0.25)+((_card_rot < pi)*pi)

#region // card face
if !surface_exists(card_surf) || (update_spr){
	update_spr = false
	card_surf = surface_create(_card_width, _card_height);
	//surface_set_target(card_surf);
	//draw_clear_alpha(c_black, 0);
	//surface_reset_target();


	surface_set_target(card_surf);
	draw_clear_alpha(c_black, 0);
	draw_set_alpha(1)

	draw_sprite_ext(sCard_base,		0,			0,0,1,1,0,col_Border,	1)
	//draw_sprite_ext(sCard_Numbers,	Value,		0,0,1,1,0,col_Num,		1)
	draw_set_font(m6x11)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_ext_transformed(_card_width*0.5, (_card_height*0.5)-8, (draw_Value_target), 10, 300, 2, 2, 0);
	//draw_text_stack(_card_width*0.5, _card_height*0.5,"x2",4, col_Num,1)
	draw_sprite_ext(sCard_Types,	Operation,	0,0,1,1,0,col_Operation,1)
	draw_sprite_ext(sCard_base,		2,			0,0,1,1,0,col_Border,	flash_a) // for flashing

	draw_sprite_ext(sCard_Warning,	2,			0,0,1,1,0,c_white,	Warning_a) // for warning if 2 cards cant murge
	draw_sprite_ext(sCard_Indicator,2,			0,0,1,1,0,c_white,	Indicator_a) // for indicateing to the player that this is what it will be
	draw_sprite_ext(sCard_Goal,		2,			0,0,1,1,0,c_white,	goal_a) // for indicateing to the player is going to win
	surface_reset_target();
}
#endregion

#region // card stack
if !surface_exists(surf){
	surf = surface_create(_card_width, _card_height+hw);
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}


surface_set_target(surf);
draw_clear_alpha(c_black, 0);
for (var sz = -card_thickness; sz < card_thickness; ++sz) {
	var is_back = ((_card_rot > pi)-0.5)*2
	
	var rx = hw+(0.5*sz*dcos(_card_rot_spr))
	var ry = -(sz*0.25*dsin(_card_rot_spr)*is_back)+(_card_height*0.125)
	if (is_back){
		if ( !(sz > -card_thickness+1 && sz < card_thickness-1) ){
			image_index = !(_card_rot < pi) //sides of card
			sprite_index = sCard_base
		} else {
			image_index = 1
			sprite_index = sCard_Stacked
		}
		draw_sprite_pos(sprite_index, image_index, //draw card back
			( hw*dsin(_card_rot_spr))+rx, ry			  + (  rs*dcos(_card_rot_spr) ),
			(-hw*dsin(_card_rot_spr))+rx, ry			  + ( -rs*dcos(_card_rot_spr) ),
			(-hw*dsin(_card_rot_spr))+rx, ry+_card_height + ( -rs*dcos(_card_rot_spr) ),
			( hw*dsin(_card_rot_spr))+rx, ry+_card_height + (  rs*dcos(_card_rot_spr) ),1)
	}
	if ( !(sz > -card_thickness+1 && sz < card_thickness-1) && !is_back ){
		var tex = surface_get_texture(card_surf);
		draw_primitive_begin_texture(pr_trianglestrip, tex);
		draw_vertex_texture((-hw*dsin(_card_rot_spr))+rx, ry			  + ( -rs*dcos(_card_rot_spr) ), 1, 0);
		draw_vertex_texture(( hw*dsin(_card_rot_spr))+rx, ry			  + (  rs*dcos(_card_rot_spr) ), 0, 0);
		draw_vertex_texture((-hw*dsin(_card_rot_spr))+rx, ry+_card_height + ( -rs*dcos(_card_rot_spr) ), 1, 1);
		draw_vertex_texture(( hw*dsin(_card_rot_spr))+rx, ry+_card_height + (  rs*dcos(_card_rot_spr) ), 0, 1); 
		draw_primitive_end();
	}
}
//draw_rectangle_color(1,1,_card_width, _card_height+hw, c_green,c_green,c_green,c_green,true)
surface_reset_target();
#endregion

draw_surface_ext(surf,x, (y-card_thickness)-(z/*+(_card_height*0.5)*/),1,1,0,c_white,image_alpha)

//draw_surface_ext(card_surf,0,0,1,1,0,c_white,1)
//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)

//draw_text(x,y,string(Value))



