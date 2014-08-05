require 'rails_helper'

RSpec.describe Topping, :type => :model do

  describe 'Toppings' do
    before(:each) do
      @topping = Topping.create!(name: "Sausages", required_bake_time: 30)
    end

    it "should be initialized with a name & required bake time" do
      expect(@topping.name).to eq("Sausages")
      expect(@topping.required_bake_time).to eq(30)
    end

    it "should have a baked time" do
      expect(@topping.attributes).to include("time_baked")
    end

    it "should have a default baked time of 0" do
      expect(@topping.time_baked).to eq(0)
    end
  end
end

