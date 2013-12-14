json.array!(@job_call_notes) do |job_call_note|
  json.extract! job_call_note, :id, :job_site_id, :call_date_time, :call_notes, :employee_id
  json.url job_call_note_url(job_call_note, format: :json)
end
