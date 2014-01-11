class CreateJobEstimates < ActiveRecord::Migration
  def change
    create_table :job_estimates do |t|
      t.string :name
      t.decimal :total_item_price
      t.decimal :price_adjustment
      t.string :reason_desc
      t.integer :estimate_status_id

      t.timestamps
    end
  end
end
