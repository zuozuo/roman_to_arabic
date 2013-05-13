require_relative "roman_numeric"

class Translator

	attr_reader :input, :output

	def initialize(input_path="input.txt", output_path="output.txt")
		@nums, @units= {}, {}
		@input, @output = input_path, output_path
	end

	def read(path=input)
		clear
		if File.exist?(path) 
			File.readlines(path).each_with_index { |line, line_num|  parse(line, line_num) }
		else
			write("Can not find input file!")
		end
	end

	def write(content, path=output)
		File.open(path, 'a') { |file| file.puts content }
	end

	def parse(str, line_num=0)
		begin
			case str
			when /^(\w+)\sis\s([I|V|X|L|C|D|M])$/
				@nums[$1] = $2
			when unit_regexp
				@units[$4] = ($5.to_f/convert_to_roman($1))
			when how_much_regexp
				write "#{$1} is #{convert_to_roman($1).to_i}"
			when credits_regexp
				num = (@units[$5] * convert_to_roman($1)).to_i
				write "#{$1} #{$5} is #{num} Credits"
			else
				write "I have no idea what you are talking about"
			end
		rescue Exception => e
			write "\nERROR HAPPENED\n"
			write "\t#{e.message} \n \tIt appears in #{input} at line #{line_num}: #{str}\n"
		end
	end

	def convert_to_roman(str)
		new_str = str.clone
		@nums.each { |k, v| new_str.gsub!(k, v) }
		new_str.gsub!(/\s+/, "")
		if new_str.is_roman_numeral? 
			RomanNumeric.new(new_str)
		else
			raise InvalidInput.new("The number [#{str.chop}] you input converted to #{new_str} is invalid!")
		end
	end

	def unit_regexp
		Regexp.new "^(((#{@nums.keys.join('|')})\\s)+)(\\w+)\\sis\\s(\\d+)\\sCredits"
	end

	def how_much_regexp
		Regexp.new "^how\\smuch\\sis\\s(((#{@nums.keys.join('|')})[\\s|\\?])+)"
	end

	def credits_regexp
		Regexp.new "^how\\smany\\sCredits\\sis\\s(((#{@nums.keys.join('|')})\\s)+)((#{@units.keys.join('|')})[\\s|\?])"
	end

	def inspect
		{:input => input, :output => :output}
	end

	def show_answer
		puts "\nThe answer is : \n"
		"\t" << File.read(output).gsub(/\n/, "\n\t")
	end

	def clear
		File.open(output, 'w') {|file| file.truncate(0) }
	end
	
end
 
class InvalidInput < Exception; end
