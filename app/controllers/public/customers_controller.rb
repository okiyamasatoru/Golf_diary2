class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @movies = @customer.movies
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
  end

  def index
    @customers = Customer.all
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end


end
