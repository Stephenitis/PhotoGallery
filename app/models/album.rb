class Album < ActiveRecord::Base
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
