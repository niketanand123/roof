class CreateJobEstimates < ActiveRecord::Migration
  def change
    create_table :job_estimates do |t|
      t.integer :job_detail_id
      t.integer :step
      t.integer :master_item_id
      t.integer :qty
      t.string :proposal_desc
      t.string :warranty_desc
      t.decimal :retail_price
      t.decimal :item_extended

      t.timestamps
    end
  end
end
