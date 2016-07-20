class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :merchant, foreign_key: true
      t.string :name
      t.text :description
      t.integer :unit_price

      t.timestamps
    end
  end
end
