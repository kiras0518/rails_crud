class RenameTable < ActiveRecord::Migration[5.2]
  def change
    drop_table(rename_table) 
  end
end
