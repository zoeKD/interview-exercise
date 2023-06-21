class AddTableSchemaToCustomerTables < ActiveRecord::Migration[7.0]
  def change
    add_column :customer_tables, :table_schema, :jsonb, default: {}
  end
end
