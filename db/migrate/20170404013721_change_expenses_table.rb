class ChangeExpensesTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :expenses, :parcel, :integer
    add_column :expenses, :form_of_payment, :integer
    add_column :expenses, :parceled, :boolean
    rename_column :expenses, :date, :expensed_at
    rename_column :expenses, :is_payed, :paid
  end
end
