json.array!(@job_sites) do |job_site|
  json.extract! job_site, :id
  json.url job_site_url(job_site, format: :json)
end
