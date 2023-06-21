class CustomerTable < ApplicationRecord

  # Consider moving this to Query command instead of model (depending on pattern)
  class << self
    def table_name_for_customer(customer_id)
      CustomerTable.find_by!(customer_id: customer_id).table_name
    end
  end
end
