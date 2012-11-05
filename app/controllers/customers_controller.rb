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
 def edit
   @customer = Customer.find(params[:id])
 end

 def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
       flash[:notice] = "Customer has been updated."
       redirect_to @customer
    else
       flash[:alert] = "Customer has not been updated."
       render :action => "edit"
    end
 end

 def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy 
    flash[:notice] = "Customer has been deleted."
    redirect_to  customers_path
 end

end
