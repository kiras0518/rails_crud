require 'rails_helper'

RSpec.describe Task, type: :model do

  before :each do
    @task = Task.new(title: '標題', context: '內容', status: rand(0..2), priority: rand(0..2), end_date: DateTime.current)
    @task.save
  end

  describe "Validation" do

    it "新增一個任務，無標題" do
      @task.title = nil
      expect(@task.save).to be false
    end
  
    it "新增一個任務，無任務內容" do
      @task.context = nil
      expect(@task.save).to be true
    end
  
    it "新增一個任務，無優先權" do
      @task.priority = nil
      expect(@task.save).to be false
    end
  
    it "新增一個任務，無狀態" do
      @task.status = nil
      expect(@task.save).to be false
    end
  
    it "新增一個任務，無選擇結束時間" do
      @task.end_date = nil
      expect(@task.save).to be false
    end

  end

end
