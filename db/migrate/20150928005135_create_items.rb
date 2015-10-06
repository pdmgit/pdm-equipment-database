class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :asset_number
      t.integer :quantity
      t.text :description

      t.timestamps null: false
    end
  end
end
