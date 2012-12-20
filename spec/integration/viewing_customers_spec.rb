require 'spec_helper'

feature "Viewing customers" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:customer) { Factory(:customer) }
  before do
    sign_in_as!(user)
    define_permission!(user, :view, customer) 
  end

  scenario "Listing all customers" do
    visit '/'
    click_link customer.name
    page.current_url.should == customer_url(customer)
  end
end

