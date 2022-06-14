class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre
  belongs_to :place_genre
  belongs_to :status_genre
  belongs_to :scheduled_day_genre
  belongs_to :send_price_genre

  with_options presence: true do
    validates :name
    validates :profile
    validates :category_genre_id, numericality: { other_than: 1 }
    validates :status_genre_id, numericality: { other_than: 1 }
    validates :send_price_genre_id, numericality: { other_than: 1 }
    validates :place_genre_id, numericality: { other_than: 1 }
    validates :scheduled_day_genre_id, numericality: { other_than: 1 }
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end
end
