require 'rails_helper'

RSpec.describe Address do
  describe "validations" do
    it { should validate_presence_of :nickname }
    it { should belong_to :user }
  end

  describe "relationships" do
    it { should have_many(:orders).through(:order_addresses)}
  end

  # describe "nicknames index values" do
  #   it "lists the integers vs. string" do
  #     address = Address.create!(address: "123 4th St.", city: "city", state: "CO", zip: "zip", nickname: 0)
  #     address_2 = Address.create!(address: "Street Two", city: "city", state: "CO", zip: "zip", nickname: 1)
  #     address_3 = Address.create!(address: "Street Three", city: "city", state: "CO", zip: "zip", nickname: 2)
  #
  #     expect(address.nicknames).to eq(0)
  #   end
  # end
end
