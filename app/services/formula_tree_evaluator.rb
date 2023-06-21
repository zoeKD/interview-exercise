class FormulaTreeEvaluator
  OPERATORS = ['+', '-', '/', '*']

  def call(formula_id, expression)
    tree = FormulaTree.find(formula_id)

    evaluate(tree, expression)
  end

  private

  # formula_id = '123'
  # expression = { element1: 1.0, element2: 2.0, element3: 6.0, element4: 2.0 }
  # result = 6.0
  # FormulaTreeEvalutor.call(formula_id, expression) == formula_tree
end
