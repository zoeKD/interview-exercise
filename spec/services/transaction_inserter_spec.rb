require 'rails_helper'

RSpec.describe TransactionInserter do
  subject(:call) { described_class.call(customer_id:, attributes:) }

  before do
    CustomerTable.create!(customer_id:, table_name: 'transactions', table_schema:)
  end

  let(:customer_id) { SecureRandom.uuid }
  let(:attributes) do
    {
      'description' => 'some description',
      'object_id' => SecureRandom.uuid,
     }
  end
  let(:table_schema) do
    {
      'object_id': 'type:string;required:true',
    }
  end

  let(:created_transaction) { Transaction.last }

  it 'adds a record in the database' do
    expect { call }.to change { Transaction.count }.by(1)
  end
end
