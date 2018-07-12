class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :tilte
      t.integer :status
      t.text :context
      t.datetime :end_date

      t.timestamps
    end
  end
end
