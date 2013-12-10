class CreateProductColors < ActiveRecord::Migration
  def change
    create_table :product_colors do |t|
      t.string :product_color

      t.timestamps
    end
  end
end
