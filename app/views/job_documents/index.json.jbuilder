json.array!(@job_documents) do |job_document|
  json.extract! job_document, :id, :job_site_id, :doc_name, :doc_desc, :doc_link
  json.url job_document_url(job_document, format: :json)
end
