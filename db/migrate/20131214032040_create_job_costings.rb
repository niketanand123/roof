class CreateJobCostings < ActiveRecord::Migration
  def change
    create_table :job_costings do |t|
      t.integer :job_site_id
      t.string :materials
      t.string :labor
      t.decimal :job_cost
      t.decimal :overhead
      t.integer :overhead_percentage
      t.decimal :net_profit

      t.timestamps
    end
  end
end
