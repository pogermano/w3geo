require 'spec_helper'

feature "Editing Customers" do
   before do 
       sign_in_as!(Factory(:admin_user))
       Factory(:customer, :name => "W3G")
       visit "/"
       click_link "W3G"
       click_link "Edit Customer"
   end

    scenario "Updating a customer" do
       fill_in "Name", :with => "W3G Solutions"
       click_button "Update Customer"
       page.should have_content("Customer has been updated.")
     end
    scenario "Updating a customer with invalid attributes is bad" do
       fill_in "Name", :with => ""
       click_button "Update Customer"
       page.should have_content("Customer has not been updated.")
     end



end

