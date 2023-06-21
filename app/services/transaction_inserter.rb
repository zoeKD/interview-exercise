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
    table_schema = CustomerTable.table_schema_for_customer(@customer_id)

    sanitized_columns = TableColumnSanitizer.call(table_name, attributes.keys)
    sanitized_attributes.slice(sanitized_columns)

    raise 'Invalid values format' unless CustomerValuesValidator.valid?(table_schema, sanitized_attributes)

    query = <<-SQL
      INSERT INTO #{table_name} (#{sanitized_columns})
      VALUES (#{sanitized_attributes.values})
    SQL

    ActiveRecord::Base.connection.execute(query)
  end
end
