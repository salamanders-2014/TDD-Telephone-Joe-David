require 'rails_helper'

RSpec.describe Pizza, :type => :model do

  describe 'Pizza' do
    before(:each) do
      @pizza = Pizza.create!(name: "Cheese")
    end

    it "should have a name" do
      expect(@pizza.name).to eq("Cheese")
    end

    it "should have a description & time_baked" do
      expect(@pizza.attributes).to include(:description, :time_baked)
    end

    it "should have a default baked time of 0" do
      expect(@pizza.time_baked).to eq(0)
    end
  end

  describe 'Toppings' do
    before(:each) do
      @topping = Topping.create(name: "Sausages", required_bake_time: 30)
    end

    it "should be initialized with a name & required bake time" do
      expect(@topping.name).to eq("Sausages")
      expect(@topping.required_bake_time).to eq(30)
    end

    it "should have a baked time" do
      expect(@topping.attributes).to include(:time_baked)
    end

    it "should have a default baked time of 0" do
      expect(@topping.time_baked).to eq(0)
    end
  end
end


# A pizza has many toppings
# A pizza should have a method required_bake_time which returns the sum of 900 (15 minutes) plus the maximum bake time of all its toppings
# A pizza should have a method bake(time), which increments time_baked by the integer argument time, and invokes bake(time) on all of its toppings
# A pizza should have a method baked? which returns a boolean indicating whether the pizza and its toppings have finished baking or not (based on required_bake_time)
# A pizza should have a method finished_toppings which returns an array of its toppings that have finished baking
# A pizza shold have a method unfinished_toppings which returns an array of its toppings that have not yet finished baking
# A topping should have attributes name, required_bake_time, time_baked
# A topping must be initialized with string name and integer required_bake_time
# A pizza's time_baked defaults to 0
# A topping should have a method bake(time) which increments time_baked by the integer argument time
# A topping should have a method baked? which returns a boolean indicating whether time_baked is greater than required_bake_time
