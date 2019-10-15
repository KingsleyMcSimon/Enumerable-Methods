# /usr/bin/ruby
# frozen_string_literal: true



module Enumerable

    def my_each #This is my_each method
        a = 0
        self.size.times do
            yield(self[a])
            a += 1

        end

        self
    end

    def my_each_with_index #my_each_with_index
        a = 0
        self.size.times do
            yield(self[a], a)
            a += 1
        end

        self

    end

    def my_select #my_select method
        myselect = []
        self.my_each do |b|
            if yield (b)
                myselect.push (b)

            end

        end

        myselect

    end

    def my_all? #my_all method
        myall = []
        output = true
        self.my_each do |b|
            if yield (b)
                myall.push (b)
            end
        end
        if myall.length == self.length
            output = true
        else
            output = false
        end
        output
    end

    def my_any? #my_any? method
        output = false
        self.my_each do |b|
            if yield (b)
                output = true
                break

            end

        end
        output
    end

    def my_none? #my_none methods
        output = true
        self.my_each do |b|
            if yield (b)
                output = false
                break
            end
        end
        output
    end

    def my_count parameter = nil #my_count method
        mycount = 0
        self.my_each do |b|
            if parameter != nil 
                if parameter == self[b]
                    mycount += 1
                end
            else
                if yield (b)
                    mycount += 1
                    self.my_each do |element|
                        if parameter
                            if element == parameter
                                mycount += 1
                            end
                        end
                    elsif block_given?
                        mycount += if yield(element)
                        else
                            mycount = self.length
                        end
                    end
                    mycount
                end

    def my_map #my_map method
        mymap = []
        self.my_each do |b|
            mymap.push yield(b)
        end
        mymap
    end

    def my_map_again(myproc) #my_mapa_gain method which takes a proc
        self.my_each do |b|
        mymapagain.push myproc.call(b)
        end
        mymapagain
    end

    def my_map_final myproc = nil #my_map_final method which an either take a proc or a block
        mymapfinal = []
        self.my_each do |b|
            if myproc == nil 
                mymapfinal.push yield(b)
            else
                mymapfinal.push myproc.call(b)
            end 
        end
        mymapfinal
    end

    def my_inject #my_inject method
        output = nil
        my_each = result ? yield (output, b) : self |0|
    end
    output
end

   def multiply_els #multiply_els method
    my_inject {|mult, b | mult + b}

   end
end





#Testing for my_each method 
#(To test each of these methods, you can take it out of the comment and go ahead with the testing )

#arraysofnumbers = [2, 4, 6, 8, 10, 12]
#arraysofnumbers.my_each do |numbers|
 #   numbers *= 5
  #  print "#{numbers}"
#end

#Testing for my_each_with_index method

#arraysofnumbers = [2, 4, 6, 8, 10, 12, 20, 50, 19, 25, 30, 40]
#arraysofnumbers.my_each_with_index do |value, index|
#puts "arraysofnumbers index #{index} takes the value of #{value}"
#end

#Testing for my_select method

#arraysofnumbers = [2, 4, 6, 8, 10, 12, 20, 50, 19, 25, 30, 50]
#output = arraysofnumbers.my_select do |numbers| numbers % 2 != 0; end
#print output

#Testing for my_all method

#arraysofnumbers = [2, 4, 6, 8, 10, 12, 20, 50, 19, 25, 30, 40]
#output = arraysofnumbers.my_all? do |b| b % 2 == 0; end
#print output

#Testing for my_any method

#arraysofnumbers = [2, 4, 6, 8, 10, 12, 20, 50, 19, 25, 30, 25]
#output = arraysofnumbers.my_any? do |b| b < 3; end
#print output

#Testing for my_none method

#arraysofnumbers = [2, 4, 6, 8, 10, 12, 20, 50, 19, 25, 30, 10]
#output = arraysofnumbers.my_none? do |b| b % 2 == 1; end
#print output

#Testing for my_count method

#arraysofnumbers = [2, 5, 8, 10, 20, 15, 25, 15, 8, 4, 6]
#arraysofnumbers = [5, 8, 10, 15, 15, 8, 4, 6, 8, 2, 12, 7, 8, 10]
#output = arraysofnumbers.my_count 
#output = arraysofnumbers.my_count (10)
#output = arraysofnumbers () do |numbers| numbers % 2 == 1; end
#output = arraysofnumbers (5) do |numbers|; end
#print output

#Testing for my_map method

#arraysofnumbers = [2, 4, 6, 8, 10, 12, 20, 50, 19, 25, 30, 20]
#output = arraysofumbers.my_map do |numbers| numbers * 2; end 
#print output

#Testing for my_map_again method (that takes a proc)

#arraysofnumbers = [2, 4, 6, 8, 10, 12, 20, 50, 19, 25, 30, 10, 10]
#myproc = Proc.new do |numbers| numbers * 2; end
#output = arraysofnumbers.my_map_again(myproc)
#print output

#Testing for my_map_final(3) (that takes either a proc or a block)

#arraysofnumbers = [2, 4, 6, 8, 10, 12, 20, 50, 19, 25, 35, 30]
#myproc = Proc.new do |numbers| numbers * 2; end
#output = arraysofnumbers.my_map_final do |numbers| numbers * 3; end 
#print output

#Testing for my_inject method

#def multiply_els(arraysofnumbers)
#arraysofnumbers.my_inject(1) do |total, numbers|total * numbers; end
#end
#arraysofnumbers = [1, 4, 5, 3, 2]
#puts multiply_els(arraysofnumbers)


