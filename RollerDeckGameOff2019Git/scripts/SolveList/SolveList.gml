var numbers			 = argument0
var solutionSoFar	 = argument1
var operations		 = argument2
var target			 = argument3


//array_sort(numbers, false)

for (var i = 0; i < array_length_1d(numbers)-1; ++i) {
	if numbers[i] != -1 {
		var first  = numbers[i]
		var second = numbers[i+1]
		if(second == target){
			return false
		}
		for (var j = 0; j < array_length_1d(operations); ++j) {
		    var func = operations[j]
			var out = script_execute(card_to_func(func), first, second)
			var newNumber = out[0]
			var solution  = out[1]
			if(newNumber == floor(newNumber)){
				if newNumber == target{
					global.cards_out[i+2] = [second, func]
					//show_message( "Target: " + string(target) + ":" + string(solutionSoFar) + ",\n" + string(solution) + "\n DONE!")
					return true
				} else if (newNumber){
					//show_message("TODO")
					//show_message(newNumber)
					numbers[i] = -1
					numbers[i+1] = newNumber
					global.cards_out[i+2] = [second, func]
					if SolveList(numbers, solutionSoFar + ",\n" + string(solution), operations, target){
						return true
					}
				}
			}
		}
	}
}
return false
