require 'rails_helper'

RSpec.describe TransactionInserter do
  subject(:call) { described_class.call(customer_id:, attributes:) }

  before do
    CustomerTable.create!(customer_id:, table_name: 'transactions')
  end

  let(:customer_id) { SecureRandom.uuid }
  let(:attributes) do
    { 'description' => 'some description' }
  end

  it 'adds a record in the database' do
    expect { call }.to change { Transaction.count }.by(1)
  end
end
