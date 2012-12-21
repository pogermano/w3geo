require 'spec_helper'

describe TicketsController do
  let(:user) { Factory(:confirmed_user) }
  let(:customer) { Factory(:customer) }
  let(:ticket) { Factory(:ticket, :customer => customer, :user => user) }

  context "standard users" do
      it "cannot access a ticket for a customer" do
        sign_in(:user, user)
        get :show, :id => ticket.id, :customer_id => customer.id
        response.should redirect_to(root_path)
        flash[:alert].should eql("The customer you were looking " +
        "for could not be found.")
      end
  end

  context "with permission to view the customer" do

  before do
    sign_in(:user, user)
    define_permission!(user, "view", customer)
  end

  def cannot_create_tickets!
    response.should redirect_to(customer)
    message = "You cannot create tickets on this customer."
    flash[:alert].should eql(message)
  end

  def cannot_update_tickets!
    response.should redirect_to(customer)
    flash[:alert].should eql("You cannot edit tickets on this customer.")
  end

  it "cannot begin to create a ticket" do
    get :new, :customer_id => customer.id
    cannot_create_tickets!
  end

  it "cannot create a ticket without permission" do
    post :create, :customer_id => customer.id
    cannot_create_tickets!
  end

  it "cannot edit a ticket without permission" do
    get :edit, { :customer_id => customer.id, :id => ticket.id }
    cannot_update_tickets!
  end

  it "cannot update a ticket without permission" do
    put :update, { :customer_id => customer.id, :id => ticket.id,
:ticket => {}
    }
    cannot_update_tickets!
  end



end

end

