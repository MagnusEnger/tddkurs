require_relative '../lib/string_calc'
require_relative '../lib/slow_logger'
require 'bogus/rspec'

describe StringCalculator do
  describe "Adding" do

  let(:calc) { StringCalculator.new(fake(:slow_logger)) }
  
    context "empty string" do
      it "should return 0" do
          result = calc.add("")
          
          result.should == 0
      end
    end
    context "the number 1" do
      it "returns 1" do
        result = calc.add("1")
        
        result.should == 1
      end
    end
    context "with a logger" do
      it "logs" do
        logger = fake(:slow_logger)
        calc = StringCalculator.new(logger)
        
        result = calc.add("1")
        
        logger.should have_received.write( "got 1" )
      end
    end
  
  end
end
