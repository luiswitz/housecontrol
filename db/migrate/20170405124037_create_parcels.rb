class CreateParcels < ActiveRecord::Migration[5.0]
  def change
    create_table :parcels do |t|
      t.boolean :paid
      t.integer :number
      t.decimal :value
      t.date :due_date
      t.references :expense, foreign_key: true

      t.timestamps
    end
  end
end
