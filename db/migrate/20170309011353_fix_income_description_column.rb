class FixIncomeDescriptionColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :incomes, :descritption, :description
  end
end
