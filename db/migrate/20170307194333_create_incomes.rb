class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.string :descritption
      t.decimal :value
      t.date :date
      t.references :category, foreign_key: true
      t.boolean :received
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
