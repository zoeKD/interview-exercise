class FormulasController < ApplicationController
  def create
    FormulaTreeCreator.call(params[:formula])
  end

  def evaluate
    FormulaTreeEvaluator.call(params)
  end
end
