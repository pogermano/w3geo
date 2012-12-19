require 'spec_helper'

   feature "hidden links" do
      let(:user) { Factory(:confirmed_user) }
      let(:admin) { Factory(:admin_user) }
      let(:customer) { Factory(:customer) }

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




  end
end


