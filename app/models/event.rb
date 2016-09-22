class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  mount_uploader :logo, PhotoUploader
  mount_uploader :primary_image, PhotoUploader


end
