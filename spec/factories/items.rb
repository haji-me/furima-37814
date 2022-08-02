FactoryBot.define do
  factory :item do
    name                        { 'test' }
    explanation                 { '状態はとても良い商品です。' }
    detail_category_id          { '3' }
    detail_condition_id         { '3' }
    delivery_charge_id          { '3' }
    prefecture_id               { '3' }
    delivery_date_id            { '3' }
    price                       { '3000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
