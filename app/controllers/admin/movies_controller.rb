class Admin::MoviesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @customer = @movie.customer
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to admin_customer_path(@customer.id)
  end
  
   private

  def movie_params
    params.require(:movie).permit(:content, :movie)
  end
end
