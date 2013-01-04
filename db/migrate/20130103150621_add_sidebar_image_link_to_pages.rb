class AddSidebarImageLinkToPages < ActiveRecord::Migration
  def change
    add_column :pages, :sidebar_image_link, :string
  end
end
