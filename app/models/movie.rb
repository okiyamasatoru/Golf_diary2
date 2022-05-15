class Movie < ApplicationRecord
  has_one_attached :profile_image
  has_one_attached :movie
  validates :movie, presence: true
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def self.looks(search, word)
    if search == "partial_match"
      @movie = Movie.where("content LIKE?","%#{word}%")
    else
      @movie = Movie.all
    end
  end
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
