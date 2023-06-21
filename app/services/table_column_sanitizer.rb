class TableColumnSanitizer
  SCHEMA_NAME = 'marble-interview' # Should be in env var

  class << self
    def call(*args)
      new(*args).call
    end
  end

  def initialize(table_name:, columns:)
    @table_name = table_name
    @columns = columns
  end


  def call
    query = <<-SQL
      SELECT *
      FROM information_schema.columns
      WHERE table_schema = #{SCHEMA_NAME}
      AND table_name   = #{@table_name}
    SQL

    table_columns = ActiveRecord::Base.connection.execute(query) #  I'm supposing return format is Array

    @columns & table_columns
  end
end
