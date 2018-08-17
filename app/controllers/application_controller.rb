class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, only: [:create, :edit, :update, :new, :destroy]

    def after_sign_in_path_for(resource)
        tasks_path
    end

    protected
    
    def configure_permitted_parameters
        #註冊頁面
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        #修改註冊資料
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
