class TicketsController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show]
before_filter :find_customer
before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]

def new
  @ticket = @customer.tickets.build
end

def edit

end


def update
   if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to [@customer, @ticket]
   else
      flash[:alert] = "Ticket has not been updated."
      render :action => "edit"
   end
end

def destroy
      @ticket.destroy
      flash[:notice] = "Ticket has been deleted."
      redirect_to @customer
end

def show
end

def create
  @ticket = @customer.tickets.build(params[:ticket])
  @ticket.user = current_user

  if @ticket.save
     flash[:notice] = "Ticket has been created."
     redirect_to [@customer, @ticket]
  else
     flash[:alert] = "Ticket has not been created."
     render :action => "new"
  end
end





private
 def find_customer
    @customer = Customer.find(params[:customer_id])
 end
 def find_ticket
    @ticket = @customer.tickets.find(params[:id])
 end


end
