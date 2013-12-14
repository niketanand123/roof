class CreateJobContacts < ActiveRecord::Migration
  def change
    create_table :job_contacts do |t|
      t.integer :job_site_id
      t.string :first_name
      t.string :last_name
      t.integer :contact_type_id
      t.string :contact_phone
      t.string :contact_email
      t.string :contact_notes

      t.timestamps
    end
  end
end
