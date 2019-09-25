class Dropcollumnandaddindex < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, "#<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition"
    add_index :users, :email, unique: true
  end
end
