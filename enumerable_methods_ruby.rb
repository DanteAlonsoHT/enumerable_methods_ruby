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

  def my_select
    return to_enum(:my_select) unless block_given?

    new_array = []
    to_a.my_each do |i|
      new_array.push(i) if yield i
    end
    new_array
  end

  def my_none?(param = nil)
    if !block_given? && param.nil?
      to_a.my_each { |i| return true if i == false || i.nil? }
      return false
    elsif !block_given? && param.is_a?(Class)
      to_a.my_each { |i| return false if i.instance_of?(param) }
      return true
    elsif !block_given? && param.instance_of?(Regexp)
      to_a.my_each { |i| return false if i.match(param) }
      return true
    elsif !block_given? && !param.nil?
      to_a.my_each { |i| return false if i == param }
    elsif block_given? && param.instance_of?(Range)
      to_a.my_each { |i| return false if yield i }
      return true
    else
      to_a.my_each { |i| return false if yield i }
    end
    true
  end
end