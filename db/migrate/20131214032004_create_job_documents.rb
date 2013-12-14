class CreateJobDocuments < ActiveRecord::Migration
  def change
    create_table :job_documents do |t|
      t.integer :job_site_id
      t.string :doc_name
      t.string :doc_desc
      t.string :doc_link

      t.timestamps
    end
  end
end
