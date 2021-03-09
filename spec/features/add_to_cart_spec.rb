require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click add on product and cart total changes" do
    visit root_path

    # commented out b/c it's for debugging only
    find('article.product button', match: :first).click
    sleep(1)
    # save_and_open_screenshot

    section = find('div#navbar')
    # puts page.html
    expect(section).to have_text('1')

  end

end
