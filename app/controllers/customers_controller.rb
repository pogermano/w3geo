class CustomersController < ApplicationController
 before_filter :authorize_admin!, :except => [:index, :show]
 before_filter :find_customer, :only => [:show,
                                         :edit,
                                         :update,
                                         :destroy]
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
 end
 def edit
 end

 def update
    if @customer.update_attributes(params[:customer])
       flash[:notice] = "Customer has been updated."
       redirect_to @customer
    else
       flash[:alert] = "Customer has not been updated."
       render :action => "edit"
    end
 end

 def destroy
    @customer.destroy 
    flash[:notice] = "Customer has been deleted."
    redirect_to  customers_path
 end





private
  def find_customer
    @customer = Customer.find(params[:id])
   rescue ActiveRecord::RecordNotFound
     flash[:alert] = "The customer you were looking" +
                     " for could not be found."
     redirect_to customers_path
   end

end
