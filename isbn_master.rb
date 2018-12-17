def checkten(number)
	valid = false
	currentsum = 0
	sum = 0
	number = number.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").each_char.to_a
	p "number.length: #{number.length}"
	if number.length == 10
	number.each_with_index do |digit, ind|
		unless ind == 9
			if digit == "x"
				break
			end
			ind = ind + 1
			digit = digit.to_i
			p "This is digit: #{digit}"
			p "This is ind: #{ind}"
			currentsum = digit * ind
			p "This is currentsum: #{currentsum}" 
			sum = sum + currentsum
			p "This is sum: #{sum}"
			currentsum = 0
		end
	end
	end
	p "This is sum before modulus 11: #{sum}"
	sum = sum % 11
	if sum == 10
		sum = "x"
	end
	p "This is sum after modulus 11: #{sum}"
	p "This is the last number: #{number.last}"
	p number
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