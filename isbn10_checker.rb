def checkten(number)
	valid = false
	currentsum = 0
	sum = 0
	number = number.split('')
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
	p "This is sum after modulus 11: #{sum}"
	p "This is the last number: #{number.last}"
	p number
	if sum.to_s == number.last
		valid = true
	end
	p valid
	return valid
end