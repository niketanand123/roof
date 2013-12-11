json.array!(@job_estimates) do |job_estimate|
  json.extract! job_estimate, :id, :job_detail_id, :step, :master_item_id, :qty, :proposal_desc, :warranty_desc, :retail_price, :item_extended
  json.url job_estimate_url(job_estimate, format: :json)
end
