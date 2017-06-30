require 'rails_helper'

describe "the delete process" do
  it "deletes selected product" do
    product = Product.create(
      :name=>'test',
      :cost=>'5.00',
      :country=>'America'
    )
    visit product_path(product)
    click_link 'Delete This Product'
    page.accept_alert 'You sure?' do
        click_button('OK')
    end
    expect(page).to have_content 'All Products'
  end

end
