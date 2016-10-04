class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews

  enum region: { "United States": 0,
                 "Central & South America": 1,
                 "Europe": 2,
                 "Middle East": 3,
                 "Canada": 4,
                 "Asia": 5
              }


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  mount_uploader :logo, PhotoUploader
  mount_uploader :primary_image, PhotoUploader


end
