class Public::CommentsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    comment = current_customer.comments.new(comment_params)
    comment.movie_id = movie.id
    comment.save
    redirect_to public_movie_path(movie)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to public_movie_path(params[:movie_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
