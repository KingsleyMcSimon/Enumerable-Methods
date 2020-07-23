# /usr/bin/ruby
# frozen_string_literal: true

# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity

  module Enumerable
  # my_each method
  def my_each 
    result = self
    return result.to_enum unless block_given?

    m = 0
    while m < result.length
      yield(result[m])
      m += 1
    end
    result
  end

  # my_each_with_index method
  def my_each_with_index
    result = self
    return result.to_enum unless block_given?

    m = 0
    while m < result.length
      yield(result[m], m)
      m += 1
    end
    result
  end

  # my_select method
  def my_select
    result = self
    return result.to_enum unless block_given?

    arr = []
    result.my_each do |k|
      arr.push(k) if yield(k)
    end
    arr
  end

  # my_all? method
  def my_all?(param = nil)
    k = true
    if block_given?
      my_each { |a| k = false unless yield a }
    end
    if param.class == Regexp
      my_each { |a| k = false unless a =~ param }
    elsif param.class == Class
      my_each { |a| k = false unless a.is_a?(param) }
    elsif !param.nil?
      my_each { |a| k = false unless a == param }
    end
    if param.nil?
      my_each { |a| k = false unless a }
    end
    k
  end

  # my_any? method
  def my_any?(param = nil, &block)
    n = false
    if block
      my_each { |b| n = true if block.call(b) }
    elsif param.nil?
      my_each { |b| n = true if b }
    else
      my_each { |b| n = true if param == b }
    end
    n
  end

  # my_none method
  def my_none?(param = nil, &block)
    !my_any?(param, &block)
  end

  # my_count method
  def my_count(*param)
    mycount = 0
    length.times do |c|
      if param.empty?
        if block_given?
          mycount += 1 if yield self[c]
        else
          mycount = 1 + c
        end
      elsif self[c] == param[0]
        mycount += 1
      end
    end
    mycount
  end
  
  # my_map method
  def my_map
    return to_enum unless block_given?

    mymap = Array.new(length)
    length.times { |q| mymap[q] = yield self[q] }
    mymap
  end
  
  # my_inject method
  def my_inject(start = 0)
    i = 0
    accumulator = start
    while i < size
      i += 1
    end
    accumulator
  end

  # multiply_els method
  def multiply_els(param)
    param.my_inject(1) { |c, d| c * d }
  end
end 
