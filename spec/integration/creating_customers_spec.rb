require 'spec_helper'

 feature 'Creating Customers' do
  before  do
   visit '/'
   click_link 'New Customer'
  end

   scenario "can create a customer" do
     fill_in 'Name', :with => 'W3G'
     click_button 'Create Customer'
     page.should have_content('Customer has been created.')
     customer = Customer.find_by_name("W3G")
     page.current_url.should == customer_url(customer)
     title = "W3G - Customer - W3Geo.com"
     find("title").should have_content(title)
   end

   scenario "can not create a customer without a name" do
     click_button 'Create Customer'
     page.should have_content("Customer has not been created.")
     page.should have_content("Name can't be blank")
   end


end

