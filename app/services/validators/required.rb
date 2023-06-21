module Validators
  class Required
    def call(*args)
      new(*args).call
    end
  end

  def initialize(attributes:, column_name:, is_required:)
    @attributes = attributes
    @column_name = column_name
    @is_required = is_required
  end

  def valid?
    return true unless @is_required

    @attributes.values(@column_name).present?
  end
end
