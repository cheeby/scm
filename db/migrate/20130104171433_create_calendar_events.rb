class CreateCalendarEvents < ActiveRecord::Migration
  def self.up
    create_table :calendar_events do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.string :location
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :calendar_events
  end
end
