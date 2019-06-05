require 'rails_helper'

RSpec.describe Address do
  describe "validations" do
    it { should validate_presence_of :nickname }
    it { should belong_to :user }
  end

  describe "relationships" do
    it { should have_many(:orders).through(:order_addresses)}
  end
end
