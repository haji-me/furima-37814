class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image


  validates :name,                           presence: true,
                                             length: { maximum: 40}
  validates :explanation,                    presence: true,
                                             length: { maximum: 1000}
  validates :detail_category_id,             numericality: { other_than: 1 , message: "can't be blank"} 
  validates :detail_condition_id,            numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id,             numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,                  numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_date_id,               numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price,                          presence: true, 
                                             numericality: {greater_than: 300,less_than: 9999999},
                                             format: { with: /\A[0-9]+\z/ }
  validates :image,                          presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail_category
  belongs_to :detail_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_date

end
