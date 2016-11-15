require "rails_helper";

RSpec.feature "Listing Members" do
  before do
    @john = User.create(first_name: "John",
                        last_name: "Smith",
                        email: "john@example.com",
                        password: "password")
                        
    @sarah = User.create(first_name: "Sarah",
                        last_name: "Jones",
                        email: "sarah@example.com",
                        password: "password")
  end
  
  scenario "Shows a list of registered users" do
    visit "/"
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
  end
end