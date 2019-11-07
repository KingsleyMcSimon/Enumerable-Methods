# /usr/bin/ruby
# frozen_string_literal: true



module Enumerable

  def my_each  #my_each method
        result = self
        m = 0
        while m < result.length
            yield(result[m])
            m += 1
        end
        result
    end


def my_each_with_index  #my_each_with_index method
    result = self
    m = 0
    while m < result.length
        yield(result[m], m)
        m += 1
    end
    result
end


def my_select #my_select method
    result = 0
    arr = []
    result.my_each do |k|
        arr.push(k) if yield(k)
    end
    arr
end


  def my_all? #my_all? method
    result = self
    result.my_each do |n|
        return false unless yield(n)
    end
    true
end


    def my_any? #my_any method
        result = self
        result.my_each do |n|
            return true if yield(n)
        end
        false
    end


    def my_none? #my_none method
        result = self
        result.my_each do |d|
            return false if yield(d)
        end
        true
    end


    def my_count #my_count method
        result = self
        mycount = 0
        result.my_each do |f|
            if block_given? && yield(f)
                mycount += 1 
            else
                mycount = result.length
            end
        end
        mycount
    end


    def my_map(proc = nil) #my_map method
        result = []
        if proc
            my_each do |q|
                result << proc.call(q)
            end
        else
            my_each do |q|
                result << yield(q)
            end
        end
        result
    end

   
   def my_inject(param = self[0]) #my_inject method
    myinject = param 
    result = self
    result.my_each do |y|
        next if param == yield

        param = yield(param, y)
    end
    param
end
end


def multiply_els(par) #multiply_els method
    par.my_inject(1) { |a, b| a * b }
end


#Here are examples that could be used to test for some of the methods above.

#Testing for my_each method 
#(To test each of these methods, you can take it out of the comment and go ahead with the testing )

#k = [1, 2, 3, 4, 5]
#k.my_each do |myeach|
#puts myeach
#end

#Testing for my_each_with_index method

#fruits = %w(Mango Pawpaw Cashew Pear Orange)
#fruits.my_each_with_index do |myeachwithindex, idx|
#puts "#{myeachwithindex} is the fruit with index #{idx}"
#end

#Testing for my_select method

#strings = %w(Angle Ball Cat Capstone Conquer)
#puts strings.my_select {|word| word.size > 3 }
#end


#To test for my_inject
#array = [1, 2, 3, 4, 5]
#array.my_inject
#end

# puts arr.my_map { |i| i * 2} # => [2, 4, 6, 8, 10]

# puts multiply_els([2,4,5])

