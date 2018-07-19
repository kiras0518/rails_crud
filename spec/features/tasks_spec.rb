require 'rails_helper'

RSpec.feature "Tasks", type: :feature do

 #在每一個it的測試項目之前，都先建立一個資料
  before :each do
    @task = Task.new(title: '標題', context: '內容', status: 'pending', end_date: Time.now)
    @task.save
  end

  describe "Step8" do
    it "新增任務" do
      visit new_task_path
      fill_in :task_title, with: "好吃"
      fill_in :task_context, with: "我是內容"
      click_button "保存"
      expect(current_path).to eq '/tasks'
      expect(page).to have_content(title)
      #頁面內容有什麼have_content
      
    end

    it "修改任務" do
      visit edit_task_path(@task.id)
      fill_in :task_title, with: "大家好"
      fill_in :task_context, with: "我是面面"
      click_button "保存"
      expect(current_path).to eq '/tasks'
      expect(page).to have_content(title)
    end

    it '刪除任務' do
      #放入一個值做刪除的測試不然會錯誤
      #a = Task.create(title: 'C',context: 'BBB', status: 1, end_date: DateTime.current)
      visit tasks_path
      expect(current_path).to eq '/tasks'
      expect { click_link "刪除" }.to change(Task, :count).by(-1) 
    end

  end



end
