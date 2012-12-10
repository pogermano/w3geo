require 'spec_helper'

feature 'Deleting tickets' do
   let!(:customer) { Factory(:customer) }
   let!(:ticket) { Factory(:ticket, :customer => customer) }
   
   before do
      visit '/'
      click_link customer.name
      click_link ticket.title
   end

   scenario "Deleting a ticket" do
      click_link "Delete Ticket"
      page.should have_content("Ticket has been deleted.")
      page.current_url.should == customer_url(customer)
   end

end

