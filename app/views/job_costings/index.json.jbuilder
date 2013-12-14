json.array!(@job_costings) do |job_costing|
  json.extract! job_costing, :id, :job_site_id, :materials, :labor, :job_cost, :overhead, :overhead_percentage, :net_profit
  json.url job_costing_url(job_costing, format: :json)
end
