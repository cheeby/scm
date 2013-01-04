require File.dirname(__FILE__) + '/../spec_helper'

describe EventCategory do
  it "should be valid" do
    EventCategory.new.should be_valid
  end
end
