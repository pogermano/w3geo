require 'spec_helper'

feature "Assigning permissions" do
  let!(:admin) { Factory(:admin_user) }
  let!(:user) { Factory(:confirmed_user) }
  let!(:customer) { Factory(:customer) }
  let!(:ticket) { Factory(:ticket, :customer => customer, :user => user) }

  before do
    sign_in_as!(admin)

    click_link "Admin"
    click_link "Users"
    click_link user.email
    click_link "Permissions"
  end

  scenario "Viewing a customer" do
    check_permission_box "view", customer

    click_button "Update"
    click_link "Sign out"

    sign_in_as!(user)
    page.should have_content(customer.name)
  end
end

