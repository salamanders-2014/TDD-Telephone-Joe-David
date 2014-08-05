require 'rails_helper'

RSpec.describe Pizza, :type => :model do
  describe 'Pizza' do
    before(:each) do
      @pizza = Pizza.create!(name: "Cheese")
    end
    it "should have a name, description, & time_baked" do
      expect(@pizza.name).to eq("Cheese")
    end
  end
end
