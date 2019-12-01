randomize();

var oprations	 = argument0
var card_count	 = argument1
var red_herring	 = argument2
var key_val		 = argument3
var safe_val	 = argument4
var num_max		 = argument5
var num_min		 = argument6

global.cards_out_count = 0

if( key_val == safe_val ){
	return false
}

global.cards_out = [[key_val, CardType.cKey],[safe_val, CardType.cSafe]]

var solution = false
do {
	var cards = [key_val]
	for (var i = 0; i < card_count; ++i) {
		cards[i+1] = irandom_range(num_min,num_max)
	}
	solution = SolveList(cards, "", oprations, safe_val)
} until (solution);


var om = array_length_1d(global.cards_out)
for (var i = om; i < red_herring+om; ++i) {
	global.cards_out[i] = [irandom_range(num_min,num_max), irandom_range(CardType.cSub, CardType.cDiv)]
}

