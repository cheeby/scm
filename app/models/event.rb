class Event < ActiveRecord::Base
  attr_accessible :category_id, :name, :description, :location, :active, :slug, :starts_at, :ends_at
end
