
#region
if(blinking){
	blinking_time_clock = 0 //reset
	blinking_time_taken += delta_time/1000000
	if(blinking_time_taken >= blinking_time_taken_len){
		blinking = false
	}
	var val = (blinking_time_taken/blinking_time_taken_len)
	if(val < 0.5){
		image_index = lerp(0,5,val)
	}else{
		image_index = lerp(5,0,val)
	}
}else{
	blinking_time_taken = 0 //reset
	
	blinking_time_clock += delta_time/1000000
	if(blinking_time_clock >= blinking_time_clock_len){
		blinking = true
	}
	image_index = 0
}
#endregion

hight = (array_length_1d(global.cards_out)-global.cards_out_count)+1

var Hand_full = false
var obj
for (var i = 0; i < instance_number(oCard); ++i;){
	obj = instance_find(oCard,i);
	if( !(obj.drag_state == "on_table" /*&& obj.TargetSpot != id*/) ){
		Hand_full = true
		break;
	}
	if(obj.TargetSpot == id && obj.drag_state == "Picked_Up"){
		hight--
	}
}

if( global.cards_out_count < array_length_1d(global.cards_out) ){
	if (!instance_place( x, y, oCard) && !global.card_held) {
		var Card = instance_create_depth(x,y,depth,oCard)
		if ( intro_card_deal_count < instance_number(oCardSpot) ){
			Card.TargetSpot = instance_find(oCardSpot,intro_card_deal_count)//id
			intro_card_deal_count += 1
		} else {
			Card.TargetSpot = id
		}
		
		//Card.drag_state = "on_table"
		Card.z = hight*(card_thickness*0.5)
	
		//TODO
		var Card_data = global.cards_out[global.cards_out_count]
	
		global.cards_out_count++
	
		Card.Operation				 = Card_data[1]
		Card.Value					 = Card_data[0]
		Card.draw_Value				 = Card.Value
		Card.draw_Value_target		 = Card.Value
		Card.update_spr = true
	}
}
depth = y