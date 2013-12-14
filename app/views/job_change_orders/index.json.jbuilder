json.array!(@job_change_orders) do |job_change_order|
  json.extract! job_change_order, :id, :job_site_id, :co_number, :co_total, :notes
  json.url job_change_order_url(job_change_order, format: :json)
end
