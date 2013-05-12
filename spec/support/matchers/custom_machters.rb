require 'spec_helper'
require 'rspec/expectations'

RSpec::Matchers.define :be_converted_to do |expected|
  match do |actual|
		value = actual.respond_to?(:to_arabic) ? actual.to_arabic : actual.to_roman
		value == expected
  end

	failure_message_for_should do
    "expected that #{actual} be converted to #{expected} but got #{actual.respond_to?(:to_arabic) ? actual.to_arabic : actual.to_roman}"
  end

  description do
    "be converted to #{expected}"
  end
end
