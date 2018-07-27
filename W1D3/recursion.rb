def sum_to(n)
	return 1 if n == 1 
	n + sum_to(n-1)
end 

def add_numbers(arr)
	return arr[0] if arr.length <= 1 
	arr.pop + add_numbers(arr)
end

def gamma_fnc(n)
	return nil if n == 0
	return n if n == 1
	(n-1) * gamma_fnc(n-1)
end 

def ice_cream_shop(flavors, favorites)
	return false if flavors.length == 0 

	flavors.pop == favorites ? true : ice_cream_shop(flavors,favorites)
end 

def reverse(str)
	return str[0] if str.length <= 1
	str[-1] + reverse(str[0..-2])
end