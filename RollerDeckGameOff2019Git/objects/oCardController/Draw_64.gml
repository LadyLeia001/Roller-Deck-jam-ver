
draw_set_alpha(fade)
draw_rectangle_color(0,0,room_width,room_height,c_white,c_white,c_white,c_white,false)
draw_set_alpha(1)
/*
//card stack debug
draw_set_halign(fa_left)
var card_list_str = ""
for (var i = 0; i < array_length_1d(global.cards_out); ++i) {
	var _card = global.cards_out[i]
	card_list_str = card_list_str + " <" + string(_card[1]) + "> " + string(_card[0]) + ", "
}
draw_text(8,128, card_list_str)
*/