class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.text :bio
      t.string :photo
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
