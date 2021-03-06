class TicketsController < ApplicationController
before_filter :authenticate_user!
before_filter :find_customer
before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]
before_filter  :authorize_create!, :only => [:new, :create]
before_filter  :authorize_update!, :only => [:edit, :update]
before_filter :authorize_delete!, :only => :destroy

def new
  @ticket = @customer.tickets.build
  3.times { @ticket.assets.build }

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
    @customer = Customer.for(current_user).find(params[:customer_id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The customer you were looking " +
    "for could not be found."
    redirect_to root_path
 end
 def find_ticket
    @ticket = @customer.tickets.find(params[:id])
 end


  def authorize_create!
    if !current_user.admin? && cannot?("create tickets".to_sym, @customer)
      flash[:alert] = "You cannot create tickets on this customer."
      redirect_to @customer
    end
  end
  def authorize_update!
    if !current_user.admin? && cannot?("edit tickets".to_sym, @customer)
      flash[:alert] = "You cannot edit tickets on this customer."
      redirect_to @customer
    end
  end
  def authorize_delete!
    if !current_user.admin? && cannot?(:"delete tickets", @customer)
      flash[:alert] = "You cannot delete tickets from this customer."
      redirect_to @customer
     end
  end


end
