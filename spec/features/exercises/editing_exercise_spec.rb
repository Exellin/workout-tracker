require 'rails_helper'

RSpec.feature "Editing Exercise" do
  before do
    @ownder = User.create!(email: "owner@example.com", password: "password")
    
    @ownder_exercise = @owner.exercises.create!(duration_in_min: 48, 
                                                  workout: "Running",
                                                  workout_date: Date.today)
    login_as(@owner)
  end
  
  scenario "with calid data succeeds" do
    visit "/"
    
    click_link "My Lounge"
    
    path = "/users/#{@owner.id}/exercises/#{@ownder_exercise.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click_link
    
    fill_in "Duration", with: 45
    click_button "Update Exercise"
    
    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(48)
  end
end