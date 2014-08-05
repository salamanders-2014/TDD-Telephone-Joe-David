require 'rails helper'
RSpec.describe Pizza, :type => :model do
  before pizza = Pizza.create!(name: "Cheese")
  describe 'Pizza' do
    it "should have a name, description, & time_baked" do
      expect(pizza.attributes).to include(:name)
    end
  end
end
