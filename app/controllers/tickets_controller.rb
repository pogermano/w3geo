class TicketsController < ApplicationController
before_filter :find_customer
before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]

def new
  @ticket = @customer.tickets.build
  @ticket.inspect
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


def show
end

def create
  @ticket = @customer.tickets.build(params[:ticket])
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
    @customer = Customer.find{params[:customer_id]}
 end
 def find_ticket
    @ticket = @customer.tickets.find(params[:id])
 end


end
