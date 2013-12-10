class CreateEstimateTypes < ActiveRecord::Migration
  def change
    create_table :estimate_types do |t|
      t.string :estimate_type
      t.string :default_overhead

      t.timestamps
    end
  end
end
