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

  validates :name, presence: true, length: { minimum: 2 }
  validates :venue_name, presence: true
  validates :address, presence: true
  validates :country, presence: true
  validates :region, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :logo, presence: true
  validates :primary_image, presence: true

end
