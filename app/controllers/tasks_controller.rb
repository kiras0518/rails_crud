class TasksController < ApplicationController
    
    before_action :find_task, only: [:edit, :update, :destroy]

    def index
      #使用了 Model 的 all 類別方法取得所有資料，存成 @task 實體變數，以便待會在 View 可使用。
      #@task = Task.all
      #分頁顯示
      #@task = Task.page(params[:page]).per(5)
      #一次性load排序和分頁
      @tasks = Task
      #@tasks = sort(@tasks)
      #@tasks = @tasks.page(params[:page]).per(5)

      @q = Task.ransack(params[:q])
      @tasks = @q.result(distinct: true).page(params[:page]).per(5)
     
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
          redirect_to tasks_path
          flash[:info] = "新增任務成功"
        else
          render :new
        end
    end
    
    def update
      if @task.update(task_params)
          # 成功
          redirect_to tasks_path
          flash[:success] =  "資料更新成功!"
        else
          # 失敗
          render :edit
          flash[:alert] = "更新失敗!"
      end
    end

    def destroy
      @task.destroy if @task 
        redirect_to tasks_path
        flash[:alert] =  "任務已刪除!"
    end


    private

    def sort(tasks)
      return case params[:sort]
        when 'end_at' then tasks.due_date
        else tasks.latest
        end
    end
    
    def task_params
      params.require(:task).permit(:title, :context, :status, :priority, :end_date)
    end

    def find_task
      @task = Task.find_by(id: params[:id])
    end

    
end
