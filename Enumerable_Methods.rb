# /usr/bin/ruby
# frozen_string_literal: true

# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity

  module Enumerable
  # my_each method 
  UNDEFINED = Object.new
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
  def my_any?(param = nil)
    n = false
    if block_given?
      my_each { |b| n = true if yield(b) }
    elsif param.nil?
      my_each { |b| n = true if b }
    else
      my_each { |b| n = true if param == b }
    end
    n
  end

  # my_none method
  def my_none?(param = nil)
       n = true
    if block_given?
      my_each { |b| n = false if yield(b) }
    else
  n = !my_any?(param) 
  end
  n
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

  def my_inject(prev = UNDEFINED, choice = UNDEFINED)
    vol = prev
    vol = 0 if prev == UNDEFINED
    case choice

    when UNDEFINED
      if block_given?
        my_each do |b|
          vol = yield(vol, b)
        end
        vol
      elsif prev.is_a?(Symbol)
        my_inject do |mem, object|
          mem.method(prev).call(object)
        end
      end
    else
      if choice.is_a?(Symbol)
        vol = prev
        my_inject(sum) do |mem, object|
          mem.method(choice).call(object)
        end
      end
    end
  end

  # multiply_els method
  def multiply_els(param)
    param.my_inject(1) { |c, d| c * d }
  end
end 

# (5..10).my_inject { |sum, n| sum + n } 
