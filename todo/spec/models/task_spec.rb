require 'rails_helper'

RSpec.describe Task, :type => :model do
  context "A task with all information" do
    before(:each) do
      task = Task.create(title: "Test", description: "This is the description")
    end

    it "has a title" do
      expect(task.title).to eq("Test")
    end

    it "is incomplete initially" do
      expect(task.status).to eq("Incomplete")
    end

    context "marked completed"
      before(:each) do
        task.mark_as_complete!
      end
      it "should be completed" do
        expect(task.status).to eq("Complete")
      end
      it "should still be completed" do
        task.mark_as_complete!
        expect(task.status).to eq("Complete")
      end
    end

    context "marked incompleted"
      before(:each) do
        task.mark_as_incomplete!
      end
      it "should be incompleted" do
        expect(task.status).to eq("Incomplete")
      end
      it "should still be incompleted" do
        task.mark_as_incomplete!
        expect(task.status).to eq("Incomplete")
      end
    end

    context "should be able to check if completed"
      it "should return false if test is incomplete" do
        task.mark_as_incomplete!
        expect(task.complete?).to eq(false)
      end

      it 'should return true if test is complete' do
        task.mark_as_complete!
        expect(task.complete?).to eq(true)
      end
    end
  end

  context "A task without a description" do
    before(:each) do
      task = Task.create(title: "Test", description: nil, status: "Incomplete")
    end

    it 'is invalid' do
      expect(task.valid?).to eq(false)
    end
  end

  context "A task is able to be completed or incompleted" do
    before(:each) do
      task = Task.create(title: "test", description: "Descriptionn")
    end


end
