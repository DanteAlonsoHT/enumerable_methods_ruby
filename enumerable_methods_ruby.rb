module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    to_a.length.times do |i|
      yield to_a[i]
    end
    self
  end
  
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    to_a.length.times do |i|
      yield to_a[i], i
    end
    self
  end
end