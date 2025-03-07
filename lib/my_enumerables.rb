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

  def my_none?(&conditional)
    return to_enum(:my_none?) unless block_given?

    for element in self
      if conditional.call(element)
        return false
      end
    end
    return true
  end
  
  def my_count(&conditional)
  return self.length unless block_given?

  count = 0
  for element in self
    if conditional.call(element)
      count += 1
    end
  end
  return count
  end
  
  def my_map(&block)
    return to_enum(:my_map) unless block_given?

    new_arr = []
    for element in self
      new_arr << block.call(element)
    end
    return new_arr
  end

  def my_inject(init_val=0, &block)
    return to_enum(:my_inject) unless block_given?

    sum = block.call(init_val, self[0])
    self.my_each_with_index do |element, index|
      unless index == 0
        sum = block.call(sum, element)
      end
    end
    return sum
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