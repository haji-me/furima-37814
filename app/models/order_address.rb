class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipality, :street_number, :building_name, :phone, :item_id, :user_id, :order_id,
                :token

  with_options presence: true do
    validates :postcode,                       format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id,                  numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :street_number
    validates :building_name,                  allow_blank: true
    validates :phone,                          format: { with: /\A\d{10}$|^\d{11}\z/ },
                                               length: { minimum: 10, maximum: 11 }
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, street_number: street_number,
                   building_name: building_name, phone: phone, order_id: order.id)
  end
end
