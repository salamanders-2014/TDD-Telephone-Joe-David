require 'rails_helper'

RSpec.describe Task, :type => :model do
  context "A task with all information" do
    before(:each) do
      @task = Task.create!(title: "Test", description: "This is the description", status: "incomplete")
    end

    it "has a title" do
      expect(@task.title).to eq("Test")
    end
  end

  context "A task without a description" do
    before(:each) do
      @task = Task.create(title: "Test", description: nil, status: "incomplete")
    end

    it 'is valid when it has a title, description, & status' do
      expect(@task.valid?).to eq(false)
    end
  end
end
