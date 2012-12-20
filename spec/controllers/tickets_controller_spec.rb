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
end

