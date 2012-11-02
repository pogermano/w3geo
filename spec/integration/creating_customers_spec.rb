require 'spec_helper'

 feature 'Creating Customers' do
   scenario "can create a customer" do
   visit '/'
   click_link 'New Customer'
   fill_in 'Name', :with => 'W3G'
   fill_in 'Description', :with => "A 2.0 customers"
   click_button 'Create Customer'
   page.should have_content('Customer has been created.')
 end

end

