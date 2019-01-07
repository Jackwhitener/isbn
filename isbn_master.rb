def checkten(number)
	valid = false
	currentsum = 0
	sum = 0
	number = number.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").each_char.to_a
	if number.length == 10
	number.each_with_index do |digit, ind|
		unless ind == 9
			if digit == "x"
				break
			end
			ind = ind + 1
			digit = digit.to_i
			currentsum = digit * ind
			sum = sum + currentsum
			currentsum = 0
		end
	end
end
	sum = sum % 11
	if sum == 10
		sum = "x"
	end
	if sum.to_s == number.last
		valid = true
	end
	p valid
	return valid
end
def numberlengththirteen(number)
	sum = 0
	number = number.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").each_char.to_a
	number.each_with_index do |digit, ind|
		digit = digit.to_i
		p ind
	unless ind == 12
		if ind.odd?
			sum = sum + (digit * 3)
		elsif ind.even?
			sum = sum + (digit * 1)
		end
	end
	end
	return (10 - (sum % 10)) % 10
end
def checkthirteen(number, isbn)
	valid = false
	puts number
	isbn = isbn.tr("-", "")
	isbn = isbn.tr(" ", "")
	isbn = isbn.split('')
	if number.to_s == isbn.last && isbn.length == 13
		valid = true
	end

	return valid
end