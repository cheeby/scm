require File.dirname(__FILE__) + '/../spec_helper'

describe CalendarEvents do
  it "should be valid" do
    CalendarEvents.new.should be_valid
  end
end
