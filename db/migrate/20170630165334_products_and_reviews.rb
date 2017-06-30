class ProductsAndReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.column :name,:string
      t.column :cost,:float
      t.column :country,:string
      t.timestamps
    end

    create_table :reviews do |t|
      t.column :author,:string
      t.column :body,:string
      t.column :rating,:int
      t.column :product_id,:int
      t.timestamps
    end

  end
end
