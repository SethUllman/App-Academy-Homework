class AddNullCondition < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :email
    add_column :users, :email, :string, null: false
  end
end
