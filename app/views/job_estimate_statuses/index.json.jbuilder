json.array!(@job_estimate_statuses) do |job_estimate_status|
  json.extract! job_estimate_status, :id, :status
  json.url job_estimate_status_url(job_estimate_status, format: :json)
end
