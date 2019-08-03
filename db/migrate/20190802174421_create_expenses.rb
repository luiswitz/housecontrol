# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :description
      t.decimal :amount, precision: 5, scale: 2
      t.string :category
      t.date :due_date
      t.integer :status

      t.timestamps
    end
  end
end
