class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipality, :street_number, :building_name, :phone, :item_id, :user_id, :order_id,
                :token

  with_options presence: true do
    validates :postcode,                       presence: true,
                                               format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id,                  presence: true, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality, presence: true
    validates :street_number, presence: true
    validates :building_name, allow_blank: true
    validates :phone, presence: true, format: { with: /\A\d{10}$|^\d{11}\z/ },
                      length: { minimum: 10, maximum: 11 }
    validates :user_id
    validates :token, presence: true
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, street_number: street_number,
                   building_name: building_name, phone: phone, order_id: order.id)
  end
end
