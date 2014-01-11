json.array!(@job_estimates) do |job_estimate|
  json.extract! job_estimate, :id, :name, :total_item_price, :price_adjustment, :reason_desc, :estimate_status_id
  json.url job_estimate_url(job_estimate, format: :json)
end
