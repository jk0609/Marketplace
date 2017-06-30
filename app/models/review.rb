class Review < ActiveRecord::Base
  scope :recent_10, -> { order(created_at: :desc).limit(10)}

  validates :author, :presence => true
  validates :body, {
    presence: true,
    length: { maximum: 250, too_long: "Review must be under 250 characters." },
    length: { minimum: 50, too_shot: "Review must be at least 50 characters." },
  }
  validates :rating, {
    presence: true,
    numericality: { only_integer: true},
    numericality: { greater_than: 0 },
    numericality: { less_than: 6 },
  }
  belongs_to :product
end
