class AddTypeToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :kind, :integer
  end
end
