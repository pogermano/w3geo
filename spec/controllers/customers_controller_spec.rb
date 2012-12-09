require 'spec_helper'

describe CustomersController do
  it "displays an error for a missing customer" do
    get :show, :id => "not-here"
    response.should redirect_to(customers_path)
    message = "The customer you were looking for could not be found."
    flash[:alert].should == message
  end
end
