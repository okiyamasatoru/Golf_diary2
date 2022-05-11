class Movie < ApplicationRecord
  has_one_attached :profile_image
  has_one_attached :movie
  validates :movie, presence: true
  belongs_to :customer
end
