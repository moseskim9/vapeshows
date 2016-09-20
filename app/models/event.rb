class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews

  mount_uploader :logo, PhotoUploader
  mount_uploader :primary_image, PhotoUploader
end
