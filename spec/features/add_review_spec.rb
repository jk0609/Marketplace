require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    product = Product.create(
      :name=>'test',
      :cost=>'5.00',
      :country=>'America'
    )
    visit product_path(product)
    click_link 'Add Review'
    fill_in 'Author', :with => 'Test'
    fill_in 'Rating', :with => '5'
    fill_in 'Body', :with => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
    click_on 'Create Review'
    expect(page).to have_content 'Test'
  end

  it "gives error when no attributes are entered" do
    product = Product.create(
      :name=>'test',
      :cost=>'5.00',
      :country=>'America'
    )
    visit new_product_review_path(product)
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
end
