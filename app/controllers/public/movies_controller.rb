class Public::MoviesController < ApplicationController
   before_action :authenticate_customer!
  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.all
    @movie = Movie.where(customer_id: [*current_customer.following_ids])
  end

  def random
    @random = Movie.order("RANDOM()").limit(5)
  end

  def show
    @movie = Movie.find(params[:id])
    @comment = Comment.new
    @customer = @movie.customer
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.customer_id = current_customer.id
    if @movie.save
      redirect_to public_movies_path
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to public_movies_path
  end

   private

  def movie_params
    params.require(:movie).permit(:content, :movie)
  end
end
