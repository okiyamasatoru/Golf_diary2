class Public::HomesController < ApplicationController
  def top
     @random = Movie.order("RANDOM()").limit(5)
  end  
end
