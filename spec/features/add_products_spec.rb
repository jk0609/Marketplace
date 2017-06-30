require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Add Product'
    fill_in 'Name', :with => 'Test'
    fill_in 'Cost', :with => '5.00'
    fill_in 'Country', :with => 'America'
    click_on 'Create Product'
    expect(page).to have_content 'Test'
  end

  it "gives error when no attributes are entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
