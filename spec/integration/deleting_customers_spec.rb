require 'spec_helper'

feature "Deleting customers" do
   scenario "Deleting a customer" do
      Factory(:customer, :name => "W3G1")
      visit "/"
      click_link "W3G"
      click_link "Delete Customer"
      page.should have_content("Customer has been deleted.")

      visit "/"
      page.should_not have_content("W3G1")
   end
end

