class Product < ActiveRecord::Base
  scope :recent_10, -> { order(created_at: :desc).limit(10)}
  scope :recent_3, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country, count(reviews.id) as reviews_count")
      .joins(:reviews)
      .group("products.id")
      .order("reviews_count DESC")
      .limit(1)
    )}
  scope :local, -> { where('country=?', 'Liberia')}

  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country, :presence => true
  has_many :reviews

  def average_review
    total = 0
    self.reviews.each do |review|
      total += review.rating
    end
    if self.reviews.length != 0
      total/self.reviews.length
    else
      0
    end
  end
end
