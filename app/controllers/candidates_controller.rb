class CandidatesController < ApplicationController
    
    before_action :find_candidate, only: [:edit, :update, :destroy, :vote]

    def index
        @candidate = Candidate.all
        #分頁顯示
        @candidate = Candidate.page(params[:page]).per(10)
    end

    def new
        @candidate = Candidate.new
    end

    def create
        @candidate = Candidate.new(candidate_params)

        if @candidate.save
            redirect_to candidates_path, notice: "新增任務成功!"
        else
            render :new
        end
    end

    def edit
        #把 id 是 params[:id] 的資料抓出來
        #@candidate = Candidate.find(params[:id])
    end

    def update
        #@candidate = Candidate.find_by(id: params[:id])
  
        if @candidate.update(candidate_params)
          # 成功
          redirect_to candidates_path, notice: "資料更新成功!"
        else
          # 失敗
          render :edit, notice: "更新失敗!"
        end
    end

    def destroy
      #@candidate = Candidate.find_by(id: params[:id])
      @candidate.destroy if @candidate
      redirect_to candidates_path, notice: "資料已刪除!"
    end

    def vote
        #@candidate = Candidate.find_by(id: params[:id])
        @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
        redirect_to candidates_path, notice: "完成++!" 
    end

    private
    def candidate_params
      params.require(:candidate).permit(:name, :age, :party, :politics, :time)
    end

    def find_candidate
      @candidate = Candidate.find_by(id: params[:id])
    end

end
