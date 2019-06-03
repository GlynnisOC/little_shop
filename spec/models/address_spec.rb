require 'rails_helper'

RSpec.describe Address do
  describe "validations" do
    it { should validate_presence_of :nickname }
  end
end
