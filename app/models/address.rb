class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :nickname
  has_many :orders
  has_many :order_addresses
  has_many :orders, through: :order_addresses

  enum nickname: [:home, :work, :school]

  def nicknames
    address = Address.find([:id])
    Address.nicknames[address.nickname]
  end
end
