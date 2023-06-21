class TransactionsController < ApplicationController
  def create
    TransactionInserter.call(
      customer_id: customer_id,
      attributes: JSON.parse(attributes),
    )
  end

  private

  def create_params
    create_params.require(:transaction)
  end

  def customer_id
    create_params[:customer_id]
  end

  def attributes
    attributes = create_params.dup
    attributes.delete(:customer_id)
    attributes
  end
end
