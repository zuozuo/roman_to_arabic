class	String
	%W(to_arabic is_roman_numeral?).each do |name|
		send :define_method, name do 
			RomanNumerals.send(name, self) 
		end
	end
end

class Integer 
	def to_roman
		RomanNumerals.to_roman(self)
	end
end

