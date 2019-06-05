require 'rails_helper'

RSpec.describe "as a visitor on new registration form" do
  describe "I fill in all boxes" do
    it "creates primary address" do
      visit registration_path

      fill_in "Name", with: "name"
      fill_in "Address", with: "address"
      fill_in "City", with: "city"
      fill_in "State", with: "state"
      fill_in "Zip", with: "zip"
      fill_in "Email", with: "example@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"

      click_button "Submit"
      expect(current_path).to eq(profile_path)

      user = User.last
      expect(user.addresses.first.address).to eq("address")
      expect(user.addresses.first.nickname).to eq("home")
    end
  end
end
