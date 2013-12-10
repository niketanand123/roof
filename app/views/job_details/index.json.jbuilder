json.array!(@job_details) do |job_detail|
  json.extract! job_detail, :id, :job_start_date, :job_status_id, :how_many_stories, :existing_roof_type_id, :new_roof_type, :product_type_id, :product_color_id, :sales_rep_id, :estimate_type_id, :contract_price, :deposit_due, :deposit_method, :date_completed, :job_notes, :lead_sheet_note, :info_taken_by_id, :assign_to, :date_taken
  json.url job_detail_url(job_detail, format: :json)
end
