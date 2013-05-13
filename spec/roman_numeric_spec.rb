require "spec_helper"

describe RomanNumeric do

	before do
		@roman = RomanNumeric.new(2013)
	end

	context @roman do
		it "should return correct value" do
			@roman.to_i.should == 2013
			@roman.to_s.should == "MMXIII"
			@roman.to_s.should == @roman.inspect
		end
	end

	it "should behave like integer" do
		(@roman + 100).should == RomanNumeric.new(2113)
		(@roman - 100).to_s.should === "MCMXIII"
		(@roman * 2).to_i.should == 2013*2
		(@roman / 2).should == RomanNumeric.new(2013/2)
	end

	it "should support constant type of RomanNumeric" do
		(MCM + 100).should == RomanNumeric.new("MCM")+100
	end

end
