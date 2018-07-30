class TasksController < ApplicationController
    
    before_action :find_task, only: [:edit, :update, :destroy]

    def index
      #使用了 Model 的 all 類別方法取得所有資料，存成 @task 實體變數，以便待會在 View 可使用。
      #@task = Task.all
      #分頁顯示
      #@task = Task.page(params[:page]).per(5)
      #一次性load排序和分頁
      #@tasks = Task.due_date.page(params[:page]).per(5)
      @tasks = Task.latest.page(params[:page]).per(5)
      #以時間排序
      #@task = @task.due_date
      #@task = @task.latest
    end

    def new
      @task = Task.new
    end

    def show
      @task = Task.find_by(id: params[:id])
    end

    def create
      @task = Task.new(task_params)
        if @task.save
          redirect_to tasks_path, notice: "新增任務成功"
        else
          render :new
        end
    end
    
    def update
      if @task.update(task_params)
          # 成功
          redirect_to tasks_path, notice: "資料更新成功!"
        else
          # 失敗
          render :edit, notice: "更新失敗!"
      end
    end

    def destroy
      @task.destroy if @task 
        redirect_to tasks_path, notice: "任務已刪除!"
    end

    private
    
    def task_params
      params.require(:task).permit(:title, :context, :status, :end_date)
    end

    def find_task
      @task = Task.find_by(id: params[:id])
    end

    
end
