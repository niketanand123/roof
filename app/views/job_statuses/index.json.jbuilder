json.array!(@job_statuses) do |job_status|
  json.extract! job_status, :id, :job_status
  json.url job_status_url(job_status, format: :json)
end
