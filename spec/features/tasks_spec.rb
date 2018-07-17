require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
 
  before :each do
    @task = Task.new(title: '標題', context: '內容', status: 'pending', end_time: Time.now)
    @task.save
  end

  describe "step8" do
    it "新增任務" do
      title = "標題"
      visit "/tasks/new"
      fill_in :task_title, with: title
      fill_in :task_context, with: "內容"
      click_button :submit_btn
      expect(current_path).to eq '/tasks'
      expect(page).to have_content(title)
    end

    it "修改任務" do
      title = "吃麵麵"
      visit "/tasks/#{@task.id}/edit"
      fill_in :task_title, with: title
      click_button :submit_btn
      expect(current_path).to eq '/tasks'
      expect(page).to have_content(title)
    end

    it "刪除任務" do
      visit "/tasks"
      click_link I18n.t(:destroy_link, scope: [:task, :view])
      expect(current_path).to eq '/tasks'
      expect(page).to have_content(I18n.t(:destroy_success_msg, scope: [:common]))
    end
  end





end
