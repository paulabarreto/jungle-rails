# Helper function to open product images
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))

  @category.products.create!(
    name:  Faker::Hipster.sentence(3),
    description: Faker::Hipster.paragraph(4),
    image: open_asset('apparel1.jpg'),
    quantity: 10,
    price: 64.99
  )
end
