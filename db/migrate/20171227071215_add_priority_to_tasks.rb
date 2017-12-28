class AddPriorityToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :priority, :integer, default: 1
    change_column_default :tasks, :status, 1
    change_column_null :tasks, :title, false
    change_column_null :tasks, :text, false
  end
end
