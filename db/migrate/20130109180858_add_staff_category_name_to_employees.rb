class AddStaffCategoryNameToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :staff_category_name, :string
    add_index :employees, :staff_category_name
  end
end
