class Public::CustomerController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @movies = @customer.movies
  end

  def edit
  end
  
  
end
