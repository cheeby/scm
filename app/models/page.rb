class Page < ActiveRecord::Base
  attr_accessible :name, :parent_id, :intro_copy, :main_copy, :published, :sidebar_image_one, :sidebar_image_one_visible, :sidebar_image_caption, :sidebar_image_link

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]


  validates_presence_of :name, :parent_id
  validates_uniqueness_of :name

  mount_uploader :sidebar_image_one, SidebarImageOneUploader
end
