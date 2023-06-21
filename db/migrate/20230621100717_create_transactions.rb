class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :object_id, null: false
      t.boolean :is_live_version, default: false
      t.integer :amount
      t.string :account_id
      t.string :bic_country
      t.string :country
      t.string :description
      t.string :direction
      t.string :status
      t.string :title

      t.timestamps
    end
  end
end
