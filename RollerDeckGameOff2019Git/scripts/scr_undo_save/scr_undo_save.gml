with(oCardController){
	var _undo = []
	for (var i = 0; i < instance_number(oCard); ++i;){
		var card = instance_find(oCard,i);
		_undo[i] = ds_map_create()
	
		ds_map_add(_undo[i], "Value",		 card.Value)
		ds_map_add(_undo[i], "Operation",	 card.Operation)
		ds_map_add(_undo[i], "TargetSpot",	 card.TargetSpot)
		ds_map_add(_undo[i], "_targetx",	 card._targetx)
		ds_map_add(_undo[i], "_targety",	 card._targety)
		ds_map_add(_undo[i], "_targetz",	 card._targetz)
	
	}

	undo_stack[undo_count] = global.cards_out_count
	undo[undo_count] = _undo
	undo_count ++
	show_debug_message("!saved!")
}