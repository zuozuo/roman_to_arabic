#!/usr/bin/env ruby
# encoding=utf-8

Dir[File.expand_path('.') + '/lib/*.rb'].each {|file| require file }

def get_input_file_path
	print "You didn't supply no arguments for this script, the default input file is input.txt in current directory, input the custom input path or hit enter to continue with default\n"
	print "Enter custom input file path or hit enter to continue with default: "
	path = gets
	until input_valid?(path) do
		puts "File #{path} not exist"
		print "Enter custom input file path or hit enter to continue with default: "
		path = gets
	end
end

def input_valid?(path)
	path.chop!.empty? || File.exist?(path) and return true
end

def get_output_file_path
	print "You didn't supply the output file path for this script, the default output file is output.txt in current directory, input the custom output path or hit enter to continue with default\n"
	print "Enter custom output file path or hit enter to continue with default: "
	path = gets
	until input_valid?(path) do
		puts "File #{path} not exist"
		print "Enter custom output file path or hit enter to continue with default: "
		path = gets
	end
end

if ARGV.length == 0
	get_input_file_path
	get_output_file_path
elsif ARGV.length == 1
	get_output_file_path
end


t = Translator.new(ARGV.first || 'input.txt', ARGV.last || "output.txt")
t.read
puts t.show_answer
