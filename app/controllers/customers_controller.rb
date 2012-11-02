class CustomersController < ApplicationController

 def index
 end

 def new
   @customer = Customer.new
 end

 def create
    @customer = Customer.new(params[:customer])
    if @customer.save
       flash[:notice] = "Customer has been created."
       redirect_to @customer
    else
      # nothing, yet
    end
 end
 def show
   @customer = Customer.find(params[:id])
 end

end
