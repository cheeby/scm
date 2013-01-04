class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.integer :parent_id
      t.text :intro_copy
      t.text :main_copy
      t.boolean :published
      t.string :sidebar_image_one
      t.boolean :sidebar_image_one_visible
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
