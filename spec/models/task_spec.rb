require 'rails_helper'

RSpec.describe Task, type: :model do
  
  describe "Validation" do
    it "should have a status range from 0 to 2" do
      task = Task.create! title: "foo", status: rand(0..2), end_date: DateTime.current 
      expect(task).to be_valid
    end
    it "should have a priority level range from 0 to 2" do
      task = Task.create! title: "foo", priority: rand(0..2), end_date: DateTime.current 
      expect(task).to be_valid
    end
  end
 

end
