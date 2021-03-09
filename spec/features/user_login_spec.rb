require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true do

  before :each do
    @user = User.create! name: 'Alvin', email: 'ngoalvin97@gmail.com', password: '123456789'
  end

  scenario "They log in to the website" do
    visit '/login'

    fill_in 'email', with: 'ngoalvin97@gmail.com'
    fill_in 'password', with: '123456789'
    click_on 'Submit' 

    save_and_open_screenshot

    section = find('div#navbar')

    expect(section).to have_text('Alvin')
  end
end
