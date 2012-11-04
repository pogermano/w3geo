require 'spec_helper'

feature "Viewing customers" do
   scenario "Listing all customers" do
     customer = Factory.create(:customer, :name => "W3G" )
     visit '/'
     click_link 'W3G'
     page.current_url.should == customer_url(customer)
   end
end

