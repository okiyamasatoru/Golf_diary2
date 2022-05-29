class Public::HomesController < ApplicationController
  def top
    if Rails.env.production?
      @random = Movie.order("RAND()").limit(5)
    else
      @random = Movie.order("RANDOM()").limit(5)
    end
  end  
end
