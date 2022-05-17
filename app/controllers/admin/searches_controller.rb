class Admin::SearchesController < ApplicationController
   before_action :authenticate_admin!

  def search
    @range = params[:range]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @movies = Movie.looks(params[:search], params[:word])
    end
  end
end
