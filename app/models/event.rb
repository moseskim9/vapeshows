class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews

  mount_uploader :logo, PhotoUploader
  mount_uploader :primary_image, PhotoUploader

  # def new_averagerate(rating)

  #   if self.averagerate.blank?
  #      self.averagerate =rating
  #      self.save
  #    else
  #      sum = 0
  #      self.reviews.each do |review|
  #        sum += review.rate
  #        p sum
  #      end
  #      self.averagerate = (sum.to_f / self.reviews.size.to_f)
  #      self.save
  #    end
  # end
end
