class Public::HomesController < ApplicationController
  def top
    @random = Movie.random_movie.limit(5)
  end  
end
