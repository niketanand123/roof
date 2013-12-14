json.array!(@job_contacts) do |job_contact|
  json.extract! job_contact, :id, :job_site_id, :first_name, :last_name, :contact_type_id, :contact_phone, :contact_email, :contact_notes
  json.url job_contact_url(job_contact, format: :json)
end
