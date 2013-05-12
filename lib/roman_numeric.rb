require_relative 'roman_numerals'
require_relative 'dirty'

# define a class that represents a RomanNumeral 
class RomanNumeric
	attr_reader :to_i

	# May be initialized with either a string or an integer
	def initialize(value) 
		@to_i = value.is_a?(Integer) ? value : value.to_s.to_arabic
	end

	def to_s
		@to_s ||= to_i.to_roman
	end

	def ==(value)
		to_i == value.to_i
	end

	alias inspect to_s

	def method_missing(meth, *args, &blk)
		to_i.respond_to?(meth) or 
			raise NoMethodError.new("undefined method '#{meth}' for #{self}:#{self.class}") 
		result = to_i.send(meth, *args.map {|arg| arg.is_a?(RomanNumeric) ? arg.to_i : arg })
		case result
		when Integer 
			RomanNumeric.new(result)
		when Enumerable 
			result.map { |element| element.is_a?(Integer) ? RomanNumeric.new(element) : element }
		else
			result
		end
	end
end


# make III can be used and set it's value to a RomanNumeric instance
def Object.const_missing sym
	RomanNumerals::ROMAN_TEST_REGEXP === sym.to_s and return const_set(sym, RomanNumeric.new(sym))
	super
end
