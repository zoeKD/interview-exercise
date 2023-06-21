class FormulaTreeEvaluator
  def call(formula_id, expression)
    # tree = FormulaTree.create_from_formula(formula) IRL this would be in a FormulaTree model

    tree = create_from_formula(formula)
  end

  private

  def create_from_formula(formula)
    formula_array = formula.split(' ') # I'm supposing we always have a whitespace between operations & numbers

    split(formula_array)
  end

  def split(elements)
    result = []
    while elements.any?
      first_element = elements.shift

      if first_element == '('
        result << split(elements)
      elsif first_element == ')'
        return result
      else
        result << first_element
      end
    end
  end

  # formula = 'element_1 + element2 + (element_3 / element4)'
  # formula_tree = [['+', [element_1, element2, ['/', [element_3, element4]]]]]
  # FormulaTreeCreator.call(formula) == formula_tree
end
