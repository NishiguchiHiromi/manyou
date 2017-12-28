class CreateLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :labels do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.integer :task_id, null: false

      t.timestamps
    end
  end
end
