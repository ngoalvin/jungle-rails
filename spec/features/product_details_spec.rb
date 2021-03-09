require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js:true do

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

  scenario "They click on a product and get redirected to product details" do
    visit root_path

    # commented out b/c it's for debugging only
    find('article.product a', match: :first).click
    sleep(1)
    save_and_open_screenshot
    puts page.html

  end
end
