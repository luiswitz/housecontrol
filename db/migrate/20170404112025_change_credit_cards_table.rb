class ChangeCreditCardsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :credit_cards, :limit, :decimal
    add_column :credit_cards, :closing_at, :integer
    change_column :credit_cards, :due_date, :integer
  end
end
