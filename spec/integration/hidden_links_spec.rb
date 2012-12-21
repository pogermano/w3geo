require 'spec_helper'

   feature "hidden links" do
      let(:user) { Factory(:confirmed_user) }
      let(:admin) { Factory(:admin_user) }
      let(:customer) { Factory(:customer) }
      let!(:ticket) { Factory(:ticket, :customer => customer, :user => user) }

      context "anonymous users" do
        scenario "cannot see the New Customer link" do
          visit '/'
          assert_no_link_for "New Customer"
        end

       scenario "cannot see the Edit Customer link" do
         visit customer_path(customer)
         assert_no_link_for "Edit Customer"
       end

       scenario "cannot see the Delete Customer link" do
         visit customer_path(customer)
         assert_no_link_for "Delete Customer"
       end

      end

     context "regular users" do
       before { sign_in_as!(user) }
       scenario "cannot see the New Customer link" do
         visit '/'
         assert_no_link_for "New Customer"
       end

       scenario "cannot see the Edit Customer link" do
         visit customer_path(customer)
         assert_no_link_for "Edit Customer"
       end

       scenario "cannot see the Delete Customer link" do
         visit customer_path(customer)
         assert_no_link_for "Delete Customer"
       end


       scenario "New ticket link is shown to a user with permission" do
         define_permission!(user, "view", customer)
         define_permission!(user, "create tickets", customer)
         visit customer_path(customer)
         assert_link_for "New Ticket"
       end
       scenario "New ticket link is hidden from a user without permission" do      
         define_permission!(user, "view", customer)
         visit customer_path(customer)
         assert_no_link_for "New Ticket"
       end

       scenario "Edit ticket link is shown to a user with permission" do
         define_permission!(user, "view", customer)
         define_permission!(user, "edit tickets", customer)
         visit customer_path(customer)
         click_link ticket.title
         assert_link_for "Edit Ticket"
        end

        scenario "Edit ticket link is hidden from a user without permission" do
          define_permission!(user, "view", customer)
          visit customer_path(customer)
          click_link ticket.title
          assert_no_link_for "Edit Ticket"
        end

        scenario "Delete ticket link is shown to a user with permission" do
          define_permission!(user, "view", customer)
          define_permission!(user, "delete tickets", customer)
          visit customer_path(customer)
          click_link ticket.title
          assert_link_for "Delete Ticket"
        end

        scenario "Delete ticket link is hidden from users without permission" do
          define_permission!(user, "view", customer)
          visit customer_path(customer)
          click_link ticket.title
          assert_no_link_for "Delete Ticket"
        end







    end





    context "admin users" do
      before { sign_in_as!(admin) }
      scenario "can see the New Customer link" do
        visit '/'
        assert_link_for "New Customer"
    end

    scenario "can see the Edit Customer link" do
      visit customer_path(customer)
      assert_link_for "Edit Customer"
    end

    scenario "can see the Delete Customer link" do
      visit customer_path(customer)
      assert_link_for "Delete Customer"
    end

   scenario "New ticket link is shown to admins" do
      visit customer_path(customer)
      assert_link_for "New Ticket"
    end
   scenario "Edit ticket link is shown to admins" do
      visit customer_path(customer)
      click_link ticket.title
      assert_link_for "Edit Ticket"
   end


   scenario "Delete ticket link is shown to admins" do
     visit customer_path(customer)
     click_link ticket.title
     assert_link_for "Delete Ticket"
   end



 

  end
end


