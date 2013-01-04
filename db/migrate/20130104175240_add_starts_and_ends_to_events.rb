class AddStartsAndEndsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :starts_at, :date
    add_column :events, :ends_at, :date
  end
end
