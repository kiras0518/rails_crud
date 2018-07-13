class Task < ApplicationRecord
    # has_many dependent: :destroy
    # 檢查資料為非 nil 或空字串
    validates_presence_of :tilte, :status, :context, :end_date
    
end
