require "spec_helper"

describe "a string" do
	it { should respond_to(:is_roman_numeral?).with(0).arguments }
	it { should respond_to(:to_arabic).with(0).arguments }

	context "MCMXCIV" do
		it { should be_converted_to(1994) }
	end
	
end

describe 293 do
	it { should respond_to(:to_roman).with(0).arguments }
	it { should be_converted_to("CCXCIII") }
end
