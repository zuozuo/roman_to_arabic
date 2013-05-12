require 'spec_helper'

describe "Roman Numerals" do              
  it "should return right arabic numerals" do
		RomanNumerals.to_arabic("iV").should == 4
		RomanNumerals.to_arabic("MMMCMLXX").should == 3970
		RomanNumerals.to_arabic("mmMcmLxx").should == 3970
  end

	it "should return right roman numerals" do  
		RomanNumerals.to_roman(5).should == "V"
		RomanNumerals.to_roman(3970).should == "MMMCMLXX"
	end

	it "should make correct judgment on roman string testing" do  
		RomanNumerals.is_roman_numeral?("xxll").should be_nil
		RomanNumerals.is_roman_numeral?("MMCMLXI").should be_true
	end
end
