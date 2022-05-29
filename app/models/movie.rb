class Movie < ApplicationRecord
  has_one_attached :profile_image
  has_one_attached :movie
  validates :movie, presence: true
  validate :movie_type
  validate :movie_size
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
  private

  def movie_type
    if movie.blob != nil
     if !movie.blob.content_type.in?(%('video/quicktime video/quicktime'))
       errors.add(:video, '動画は携帯で撮影したmov形式でアップロードしてください')
     end   
    end
  end

  def movie_size
    if movie.blob != nil
      if movie.blob.byte_size > 15.megabytes
        errors.add(:video, "動画を短く撮影し直してください(15MB以内)")
      end
    end  
  end
end
