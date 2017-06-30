require 'rails_helper'

describe "the update product process" do
  it "updates selected product" do
    product = Product.create(
      :name=>'test',
      :cost=>'5.00',
      :country=>'America'
    )
    visit product_path(product)
    click_link 'Update Product Info'
    fill_in 'Name', :with => 'Test2'
    click_on 'Update Product'
    expect(page).to have_content 'Test2'
  end

end
