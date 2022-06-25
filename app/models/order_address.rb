class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :place_id, :town, :number, :build_name, :phone_number, :user_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :place_id, numericality: { other_than: 1 }
    validates :town
    validates :number
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, place_id: place_id, town: town, number: number, build_name: build_name,
                   phone_number: phone_number, order_id: order.id)
  end
end
