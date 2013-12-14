class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.string :task_type

      t.timestamps
    end
  end
end
