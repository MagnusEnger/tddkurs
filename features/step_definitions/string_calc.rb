class FakeLogger
  attr_accessor :numbers, :ws, :error

  def initialize(ws)
    @ws = ws
  end
  def write(text)
    begin
      @numbers = text
      if @error then raise end
    rescue 
      @ws.notify(@error)
    end
  end
  def error(error)
    @error = error
  end

end

class FakeWebService
  attr_accessor :message
  
  def notify(text)
    @message = "got '#{text}'"
  end

end

Given(/^a string calculator$/) do
  # pending # express the regexp above with the code you wish you had
end

Given(/^a slow logger instance$/) do
  # pending # express the regexp above with the code you wish you had
end

When(/^the string calculator add method is called with input  "(\d+),(\d+)"$/) do |arg1, arg2|
  @ws = FakeWebService.new
  @logger = FakeLogger.new(@ws)
  StringCalculator.new(@logger).add("#{arg1},#{arg2}")
end

Then(/^slow logger should be notified with "got (\d+)"$/) do |arg1|
  @logger.numbers.should == "got 3"
end

Given(/^a web service instance$/) do
  # pending # express the regexp above with the code you wish you had
end

When(/^calling logger results in an error 'fake error'$/) do
  @ws = FakeWebService.new
  @logger = FakeLogger.new(@ws)
end

Then(/^the web service should be notified with "got 'fake error'"$/) do
  @logger.error("fake error") # Moving this up results in an error
  StringCalculator.new(@logger).add("1,2")
  @ws.message.should == "got 'fake error'"
end

