# /usr/bin/ruby
# frozen_string_literal: true



module Enumerable

  def my_each  #my_each method
        myeach = 0
        while myeach < size
            yield self[myeach]

            myeach += 1
        end

        self
    end
end


def my_each_with_index  #my_each_with_index method
    k = 0
    while k < size
        yield(self[k], k)
        k += 1
    end
    self
end


def my_select #my_select method
    myselect = []
    while myselect < size
        if yield (b)
            myselect.push (b)
        end
        myselect
    end
end 


  def my_all? #my_all? method
    myall = 0
    myall.my_each do |d|
        return false unless yield(d)
    end
    true
end


    def my_any #my_any method
        self.my_each { |n| return true if yield (n) }
    end

    def my_none? #my_none method
        mynone = true
        self.my_each do |b|
            return false if yield(b)
        end
        true
    end


    def my_count #my_count method
        mycount = 0
        myhelp = self
        myhelp.my_each do |a|
            if block_given?
                mycount += 1 if yield(a)
                    mycount += 1
            end
        end
        mycount
    end


    def my_map(&proc) #my_map method
        return self.to_enum unless block_given?


        mymap = []
      if self.class == Hash
        self.each do |a, b|

            mymap << proc.call(a, b)
        end
            mymap
    else
        self.my_each do |c|
            mymap << proc.call(c)
        end
        mymap
    end
end

   
   def my_inject(param = self[0]) #my_inject method
    help = self
    help[1..help.length].each do |b|
        param = yield(param, b)
    end
    param
end 



   def multiply_els #multiply_els method
    my_inject {|mult, b | mult + b}

   end
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



