class Task < ApplicationRecord
    # has_many dependent: :destroy
    # 檢查資料為非 nil 或空字串
    validates_presence_of :title, :status, :context, :end_date
    # 使用時間排序
    scope :latest, -> { order(created_at: :desc) }
    scope :due_date, -> { order(end_date: :asc) }
end
