# require 'rails_helper'
#
# RSpec.describe Address do
#   describe "validations" do
#     it { should validate_presence_of :nickname }
#     it { should belong_to :user }
#   end
#
#   describe "nicknames" do
#     it "can list address as default home" do
#       user = User.create(email: "email", password: "password", name: "name", address: "address", city: "city", state: "state", zip: "zip")
#       address = user.address.create(address: "address", city: "city", state: "state", zip: "zip", nickname: 0)
#
#       expect(address.nickname).to eq("home")
#     end
#   end
# end
