class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_num, :city, :shipment_source_id, :address, :build_name, :phone_num, :user_id, :item_id, :token

  
  with_options presence: true do
    validates :post_num, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_num, format: { with: /\A\d{11}\z/, message: 'input only number' }
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :shipment_source_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, city: city, shipment_source_id: shipment_source_id, address: address, phone_num: phone_num,
                   build_name: build_name, order_id: order.id)
  end
end
