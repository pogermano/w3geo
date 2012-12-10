require 'spec_helper'
   feature "Viewing tickets" do
     before do
     textmate_2 = Factory(:customer, :name => "TextMate 2")
     Factory(:ticket,
             :customer => textmate_2,
             :title => "Make it shiny!",
             :description => "Gradients! Starbursts! Oh my!")
              internet_explorer = Factory(:customer,
             :name => "Internet Explorer")
     Factory(:ticket,
             :customer => internet_explorer,
             :title => "Standards compliance",
             :description => "Isn't a joke.")
    visit '/'
   end

   scenario "Viewing tickets for a given customer" do
      click_link "TextMate 2"
      page.should have_content("Make it shiny!")
      page.should_not have_content("Standards compliance")
      click_link "Make it shiny!"
       within("#ticket h2") do 
         page.should have_content("Make it shiny!")
      end
      page.should have_content("Gradients! Starbursts! Oh my!")
   end
end
