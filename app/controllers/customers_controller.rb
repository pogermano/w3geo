class CustomersController < ApplicationController

 def index
   @customers = Customer.all
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
       flash[:alert] = "Customer has not been created."
       render :action => "new"
    end
 end
 def show
   @customer = Customer.find(params[:id])
 end

end
