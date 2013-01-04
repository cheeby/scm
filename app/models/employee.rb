class Employee < ActiveRecord::Base
  attr_accessible :name, :position, :bio, :photo, :published
  validates_presence_of :name, :position, :bio
  validates_uniqueness_of :name

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  mount_uploader :photo, EmployeePhotoUploaderUploader
end
