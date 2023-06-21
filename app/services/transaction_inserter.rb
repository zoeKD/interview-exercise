class TransactionInserter
  class << self
    def call(*args)
      new(*args).call
    end
  end

  def initialize(customer_id:, **attributes)
    @customer_id = customer_id
    @attributes = attributes
  end

  def call
    table_name = CustomerTable.table_name_for_customer(@customer_id)
    columns = attributes.keys
    values = attributes.values

    query = <<-SQL
      INSERT INTO #{table_name} (#{columns})
      VALUES (#{values})
    SQL

    ActiveRecord::Base.connection.execute(query)
  end
end
