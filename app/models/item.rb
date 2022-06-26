class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_genre
  belongs_to :place_genre
  belongs_to :status_genre
  belongs_to :scheduled_day_genre
  belongs_to :send_price_genre

  with_options presence: true do
    validates :name
    validates :profile
    validates :category_genre_id, numericality: { other_than: 1, message: 'が未選択では登録できません' }
    validates :status_genre_id, numericality: { other_than: 1, message: 'が未選択では登録できません' }
    validates :send_price_genre_id, numericality: { other_than: 1, message: 'が未選択では登録できません' }
    validates :place_genre_id, numericality: { other_than: 1, message: 'が未選択では登録できません' }
    validates :scheduled_day_genre_id, numericality: { other_than: 1, message: 'が未選択では登録できません' }
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  end
end
