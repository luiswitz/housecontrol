class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :description
      t.decimal :value
      t.date :date
      t.references :credit_card, foreign_key: true, null: true
      t.references :category, foreign_key: true
      t.date :payment_date
      t.boolean :is_payed
      t.integer :parcel
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
