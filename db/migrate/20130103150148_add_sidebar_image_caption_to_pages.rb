class AddSidebarImageCaptionToPages < ActiveRecord::Migration
  def change
    add_column :pages, :sidebar_image_caption, :text
  end
end
