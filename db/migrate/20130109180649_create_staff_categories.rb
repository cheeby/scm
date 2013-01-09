class CreateStaffCategories < ActiveRecord::Migration
  def self.up
    create_table :staff_categories do |t|
      t.string :name
      t.boolean :active
      t.timestamps
    end
  end

  def self.down
    drop_table :staff_categories
  end
end
