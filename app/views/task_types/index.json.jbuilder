json.array!(@task_types) do |task_type|
  json.extract! task_type, :id, :task_type
  json.url task_type_url(task_type, format: :json)
end
