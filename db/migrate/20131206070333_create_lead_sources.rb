class CreateLeadSources < ActiveRecord::Migration
  def change
    create_table :lead_sources do |t|
      t.string :source

      t.timestamps
    end
  end
end
