class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
     @customers = Customer.all
  end

  def show
     @customer = Customer.find(params[:id])
     @movies = @customer.movies
  end
  
  def edit
     @customer = Customer.find(params[:id])
  end
  def update
      @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
       redirect_to admin_customer_path
     else
       render "edit"
     end
  end   
  
  def customer_params
    params.require(:customer).permit(:name, :profile_image, :is_deleted)
  end
end
