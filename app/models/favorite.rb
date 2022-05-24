class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  
end
