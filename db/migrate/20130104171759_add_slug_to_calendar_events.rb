class AddSlugToCalendarEvents < ActiveRecord::Migration
  def change
    add_column :calendar_events, :slug, :string
    add_index :calendar_events, :slug
  end
end
