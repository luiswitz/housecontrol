class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.references :credit_card_flag, foreign_key: true
      t.integer :due_date

      t.timestamps
    end
  end
end
