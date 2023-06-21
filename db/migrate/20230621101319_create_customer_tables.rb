class CreateCustomerTables < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_tables, id: :uuid do |t|
      t.integer :customer_id # IRL this would be a reference to another table
      t.string :table_name

      t.timestamps
    end
  end
end
