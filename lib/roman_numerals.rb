# Defines methods to convert integers to Roman numeral strings, and vice versa.
module RomanNumerals
  
	# regexp for testing whether a string is valid Roman Numerals
  ROMAN_TEST_REGEXP = /^M*(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$/i

	# transformational relation between Arabic numerals and Roman Numerals
  TRANS = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

	# store the base unit value in Roman Numerals
	RomanUnit = %W(M CM D CD C XC L XL X IX V IV I)

  def self.to_arabic(roman)
    is_roman_numeral?(roman) or return nil
    roman.to_s.upcase.reverse.split("").inject(0) do |mem, var|
			num, pre = TRANS[var].to_i, TRANS[roman.chop!.upcase[-1]]
			pre && pre < num and mem -= 2*pre
			mem += num
    end
  end

  def self.to_roman(num)
		RomanUnit.map do |roman|
			unit = (TRANS[roman[0]] - TRANS[roman[1]].to_i).abs
			count, num = num.divmod(unit)
			roman * count
		end.join("")
	end

	def self.is_roman_numeral?(roman)
    roman.to_s =~ ROMAN_TEST_REGEXP
  end

end

# p RomanNumerals.to_roman(1913)
