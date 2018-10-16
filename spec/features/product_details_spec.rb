require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can navigate to the product detail page" do
    # ACT
    visit root_path

    first('.product').click_link('Details')
    sleep(5)

    # VERIFY
    expect(page).to have_css 'section.products-show'

    # DEBUG / VERIFY
    save_screenshot
  end

end
