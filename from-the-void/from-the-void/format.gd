class_name Format
extends Node


static func f(number) -> String:
	var out = ""
	if (number) == 0: out = "0"
	else:
		var l = floor(log(number) / log(10))
		var mantissa = (floor(number / (10 ** (l-2)))) / 100	
		out = str(mantissa) + "e" + str(int(l))
	return out
