require "spec_helper"

describe Translator do
	it "should match Product to Product Mapping Question" do
		translator = Translator.new
    translator.read
		input = 'how many Silver is hnga glob Gold ?'
    puts translator.prd_to_prod_regexp.source
	  result = translator.prd_to_prod_regexp.match input
    result.should_not be_nil
		result['targetProduct'].should == 'Silver'
		result['sourceProduct'].should == 'Gold'
		result['sourceNumber'].should == 'hnga glob '
	end
end
