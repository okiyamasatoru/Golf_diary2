class Public::MoviesController < ApplicationController
   before_action :authenticate_customer!, only: [:new, :index, :show, :create, :destroy]
  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.page(params[:page])
    @movie = Movie.where(customer_id: [*current_customer.following_ids])
  end

  def random
    @rand = Movie.order("RAND()").limit(5)
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
      redirect_to public_customer_path(current_customer.id)
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to public_customer_path(current_customer.id)
  end

   private

  def movie_params
    params.require(:movie).permit(:content, :movie)
  end
end
