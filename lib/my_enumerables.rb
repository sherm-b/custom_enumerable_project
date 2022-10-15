module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    for element in self
      yield element, i
      i += 1
    end
    return self
  end

  def my_select(&conditional)
    return to_enum(:my_select) unless block_given?

    true_arr = []
    for element in self
      if conditional.call(element)
        true_arr << element
      end
    end
    return true_arr
  end

  def my_all?(&conditional)
    return to_enum(:my_all?) unless block_given?

    for element in self
      unless conditional.call(element)
        return false
      end
    end
    return true
  end

  def my_any?(&conditional)
    return to_enum(:my_any?) unless block_given?

    for element in self
      if conditional.call(element)
        return true
      end
    end
    return false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self
      yield element
    end
    return self
  end

end