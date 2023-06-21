class CustomerValuesValidator
  class << self
    def call(*args)
      new(*args).call
    end
  end

  def initialize(table_schema:, attributes:)
    @table_schema = table_schema
    @attributes = attributes
  end

  # table_schema example value
  # {
  #   'object_id': 'type:string;required:true',
  # }
  def valid?
    @table_schema.each do |column_name, rules|
      rules_hash = rules.split(';').map do |rule_with_validation|
        rule_with_validation.split(':')
      end.to_h

      rules_hash.all? do |rule_type, validation|
        "Validators::#{rule_type.classify}".constantize.valid?(@attributes, @attributes.value(column_name), validation)
      end
    end
  end
end
