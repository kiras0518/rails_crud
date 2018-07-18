require 'rails_helper'

RSpec.feature "Tasks", type: :feature do

 #在每一個it的測試項目之前，都先建立一個資料
  before :each do
    @task = Task.new(title: '標題', context: '內容', status: 'pending', end_date: Time.now)
    @task.save
  end

  describe "TEST" do
    it "新增任務" do
      title = "新增任務"
      visit "/tasks/new"
      fill_in :task_title, with: title
      fill_in :task_context, with: "內容"
      click_button "保存"
      expect(tasks_path).to eq '/tasks'
      expect(page).to have_content(title)
      #頁面內容有什麼have_content
    end
  end

end
