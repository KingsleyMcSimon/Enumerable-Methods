# /usr/bin/ruby
# frozen_string_literal: true

module Enumerable
  
  #my_each method
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

#my_each_with_index method
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

#my_select method
def my_select 
    result = self
    return result.to_enum unless block_given?
    arr = []
    result.my_each do |k|
        arr.push(k) if yield(k)
    end
    arr
end

# #my_all? method
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

# #my_any? method
def my_any?(param = nil, &block )
    n = false
    if block                      # &block is a reference to the block that is passed to the method
      my_each { |b| n = true if block.call(b) }
    elsif param.nil?
      my_each { |b| n = true if b }
    else
      my_each { |b| n = true if param === b }
    end
    n 
  end

# #my_none method
def my_none?(param = nil, &block)
    !my_any?(param, &block)
  end

#my_count method
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

# #my_map method
def my_map
    return to_enum unless block_given?

    mymap = Array.new(length)
    length.times { |q| mymap[q] = yield self[q] }
    mymap
  end

#my_inject method
  def my_inject(param = nil, param1 = nil)
    result = is_a?(Range) ? min : self[0]
    if block_given?
      my_each_with_index { |myinject, q| result = yield(result, myinject) if q.positive? }
      result = yield(result, param) if param
    elsif param.is_a?(Symbol) || param.is_a?(String)
      my_each_with_index { |myinject, q| result = result.send(param, myinject) if q.positive? }
    elsif param1.is_a?(Symbol) || param1.is_a?(String)
      my_each_with_index { |myinject, q| result = result.send(param1, myinject) if q.positive? }
      result = result.send(param1, param)
    end
    result
  end
end

#multiply_els method
def multiply_els(param) 
  param.my_inject(1) { |c, d| c * d }
   end

#Here are examples that could be used to test for the methods above.
# ########################################################3

# ary = [1, 2, 4, 2]
# puts ary.count                  #=> 4
# puts ary.count(2)               #=> 2
# puts ary.count { |x| x%2 == 0 } #=> 3
# puts "-----------"
# puts ary.my_count                  #=> 4
# puts ary.my_count(2)               #=> 2
# puts ary.my_count { |x| x%2 == 0 } #=> 3

# puts %w[ant bear cat].none? { |word| word.length >= 3 }
# puts %w[ant bear cat].none? { |word| word.length >= 4 }
# puts %w[ant bear cat].none?(/t/)
# puts [1, 2i, 3.14].none?(Numeric)
# puts [nil, true, 99].none?
# puts [].none?
# puts [5, 5, 6].none?(6)
# puts [5, 5, 5].none?(6)
# puts "-----------------"
# puts %w[ant bear cat].my_none? { |word| word.length >= 3 }
# puts %w[ant bear cat].my_none? { |word| word.length >= 4 }
# puts %w[ant bear cat].my_none?(/t/)
# puts [1, 2i, 3.14].my_none?(Numeric)
# puts [nil, true, 99].my_none?
# puts [].my_none?
# puts [5, 5, 6].my_none?(6)
# puts [5, 5, 5].my_none?(6)

# puts %w[ant bear cat].any? { |word| word.length >= 3 }
# puts %w[ant bear cat].any? { |word| word.length >= 4 }
# puts %w[ant bear cat].any?(/t/)
# puts [1, 2i, 3.14].any?(Numeric)
# puts [nil, true, 99].any?
# puts [].any?
# puts [5, 5, 6].any?(6)
# puts [5, 5, 5].any?(6)
# puts "-----------------"
# puts %w[ant bear cat].my_any? { |word| word.length >= 3 }
# puts %w[ant bear cat].my_any? { |word| word.length >= 4 }
# puts %w[ant bear cat].my_any?(/t/)
# puts [1, 2i, 3.14].my_any?(Numeric)
# puts [nil, true, 99].my_any?
# puts [].my_any?
# puts [5, 5, 6].my_any?(6)
# puts [5, 5, 5].my_any?(6)

# puts %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].all?(/t/)                        #=> false
# puts [1, 2i, 3.14].all?(Numeric)                       #=> true
# puts [nil, true, 99].all?                              #=> false
# puts [].all?                                           #=> true
# puts [6, 6, 6].all?(6)
# puts [6, 6, 5].all?(6)
# puts "-----------------"
# puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# puts %w[ant bear cat].my_all?(/t/)                        #=> false
# puts [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# puts [nil, true, 99].my_all?                              #=> false
# puts [].my_all?                                           #=> true
# puts [6, 6, 6].my_all?(6)
# puts [6, 6, 5].my_all?(6)

# f = [1,2,3,4,5].select { |num|  num.even?  }
# g = [1,2,3,4,5].my_select { |num|  num.even?  }
# puts f.to_s
# puts g.to_s
# a = %w{ a b c d e f }
# f = a.select { |v| v =~ /[aeiou]/ }  #=> ["a", "e"]
# g = a.my_select { |v| v =~ /[aeiou]/ }
# puts f.to_s
# puts g.to_s

# hash = Hash.new
# %w(cat dog wombat).each_with_index { |item, index|
#   hash[item] = index
# }
# puts hash.to_s
# puts "---each with index---"
# hash = Hash.new
# %w(cat dog wombat).my_each_with_index { |item, index|
#   hash[item] = index
# }
# puts hash.to_s
# puts "---my each with index ---"
# puts %w(cat dog wombat).each_with_index
# puts "---each with index---"
# puts %w(cat dog wombat).my_each_with_index
# puts "---my each with index---" 

# a = [ "a", "b", "c" ]
# puts a.each { |x| print x, " -- " }
# puts "-------- each ---------"
# puts a.my_each { |x| print x, " -- " }
# puts '-------my each---------'
# puts a.each
# puts '-------- each ---------'
# puts a.my_each
# puts '-------my each---------'

# self.to_enum

# array = [1,5,8,7,9,5,5,55,5]
# p array.my_map 

# array = [1,5,8,7,9,5,5,55,5]
#   p array.my_inject 

# puts multiply_els([10,20,30])