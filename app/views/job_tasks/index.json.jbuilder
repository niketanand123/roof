json.array!(@job_tasks) do |job_task|
  json.extract! job_task, :id, :job_site_id, :task_type_id, :task_note, :target_date, :entered_by_id, :date_completed, :completed_by_id
  json.url job_task_url(job_task, format: :json)
end
