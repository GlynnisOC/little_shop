class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :nickname
  has_many :orders, dependent: :destroy
  has_many :order_addresses
  has_many :orders, through: :order_addresses
  # has_and_belongs_to_many :orders

  enum nickname: [:home, :work, :school]

  # def nicknames
  #   address = Address.find([:id])
  #   Address.nicknames[address.nickname]
  # end
end
