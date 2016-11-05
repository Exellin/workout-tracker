require "rails_helper"

RSpec.feature "Hide sign in and sign up links while logged in" do
  before do
    @john = User.create(email: "john@exmaple.com", password: "password")
  end
  
  scenario "upon successful sign in" do
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
    
    expect(page).to have_link("Sign out")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
  end
end