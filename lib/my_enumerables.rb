module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      i = 0
      for element in self
        yield element, i
        i += 1
      end
      return self
    end
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for element in self
        yield element
      end
      return self
    end
  end

end