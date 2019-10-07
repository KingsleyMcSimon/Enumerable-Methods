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

    def my_inject merit = 0 #my_inject method
        myinjet merit
        self.my_each do |immediately|
            myinject = yield myinject immediately

        end
        myinject
    end
end




