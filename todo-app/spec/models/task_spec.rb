require 'rails_helper'

RSpec.describe Task, :type => :model do
    before(:each) do
      @task = Task.create!(title: "Test", description: "This is the description", status: "incomplete")
    end
  context "A task with all information" do

    it "has a title" do
      expect(@task.title).to eq("Test")
    end

    it "is incomplete initially" do
      expect(@task.status).to eq("incomplete")
    end
end
    context "marked completed" do
      before(:each) do
        @task.mark_as_complete!
      end
      it "should be completed" do
        expect(@task.status).to eq("Complete")
      end
      it "should still be completed" do
        @task.mark_as_complete!
        expect(@task.status).to eq("Complete")
      end
    end

    context "marked incompleted" do
      before(:each) do
        @task.mark_as_incomplete!
      end
      it "should be incompleted" do
        expect(@task.status).to eq("incomplete")
      end
      it "should still be incompleted" do
        @task.mark_as_incomplete!
        expect(@task.status).to eq("incomplete")
      end
    end

    context "should be able to check if completed" do
      it "should return false if test is incomplete" do
        @task.mark_as_incomplete!
        expect(@task.complete?).to eq(false)
      end

      it 'should return true if test is complete' do
        @task.mark_as_complete!
        expect(@task.complete?).to eq(true)
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
