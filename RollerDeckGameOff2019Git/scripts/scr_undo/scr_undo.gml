with(oCardController){
	if (undo_count >0){
		instance_destroy(oCard)

		undo_count --
		global.cards_out_count = undo_stack[undo_count]
		var _cards = undo[undo_count]

		for (var i = 0; i < array_length_1d(_cards); ++i;){
			var card_data = _cards[i]
			var card = instance_create_depth(room_width/2,room_height/2,depth,oCard)
	
			card.Value		 = card_data[? "Value"]
			card.Operation	 = card_data[? "Operation"]
			card.TargetSpot	 = card_data[? "TargetSpot"]
			card._targetx	 = card_data[? "_targetx"]
			card._targety	 = card_data[? "_targety"]
			card._targetz	 = card_data[? "_targetz"]
			card.drag_state  = "Let_Go"
			
			card.x = card._targetx
			card.y = card._targety
			card.z = card._targetz
		}
		show_debug_message("load")
		has_saved_undo = false
	}
}