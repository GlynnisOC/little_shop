class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :nickname

  enum nickname: [:home, :work, :school]
end
