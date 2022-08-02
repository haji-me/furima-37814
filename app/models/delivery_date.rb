class DeliveryDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1から2日で発送' },
    { id: 3, name: '2から3日で発送' },
    { id: 4, name: '4から7日で発送' },
  ]

  include ActiveHash::Associations
  has_many :items

end
