class CreateJobDetails < ActiveRecord::Migration
  def change
    create_table :job_details do |t|
      t.date :job_start_date
      t.integer :job_status_id
      t.string :how_many_stories
      t.integer :existing_roof_type_id
      t.integer :new_roof_type
      t.integer :product_type_id
      t.integer :product_color_id
      t.integer :sales_rep_id
      t.integer :estimate_type_id
      t.string :contract_price
      t.string :deposit_due
      t.string :deposit_method
      t.date :date_completed
      t.string :job_notes
      t.string :lead_sheet_note
      t.integer :info_taken_by_id
      t.integer :assign_to
      t.date :date_taken

      t.timestamps
    end
  end
end
