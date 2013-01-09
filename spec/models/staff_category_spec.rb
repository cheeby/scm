require File.dirname(__FILE__) + '/../spec_helper'

describe StaffCategory do
  it "should be valid" do
    StaffCategory.new.should be_valid
  end
end
