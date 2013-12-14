class CreateJobChangeOrders < ActiveRecord::Migration
  def change
    create_table :job_change_orders do |t|
      t.integer :job_site_id
      t.string :co_number
      t.string :co_total
      t.string :notes

      t.timestamps
    end
  end
end
