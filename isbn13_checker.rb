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
		puts "This is the sum at #{digit}: #{sum}"
	end
	end
	puts "This is the result: #{(10 - (sum % 10)) % 10}"
	return (10 - (sum % 10)) % 10
end
def checkthirteen(number, isbn)
	valid = false
	puts number
	isbn = isbn.tr("-", "")
	isbn = isbn.tr(" ", "")
	isbn = isbn.split('')
	puts "This is the isbn: #{isbn}"
	puts "This is the last isbn: #{isbn.last}"
	puts "This is the number: #{number}"
	if number.to_s == isbn.last
		valid = true
	end
	p "This is valid: #{valid}"
	return valid
end