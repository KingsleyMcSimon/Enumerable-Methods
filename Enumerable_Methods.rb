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

    
