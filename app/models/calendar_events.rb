class CalendarEvents < ActiveRecord::Base
  attr_accessible :category_id, :name, :description, :location, :active
end
