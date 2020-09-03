# Name of Project: 

Enumerable Methods

# Table of contents:

1. About The Project
2. Built With
3. Getting Started With The Project
4. Contributing
5. License
6. Contact/Contributors
  i. Link To Project On Github
7. What Was Learnt During The Project  
8. Acknowledgements

# About The Project:

Enumerable is a module in Ruby that provides many methods that can help with traversal, transforming, sorting, and filtering. Any class that can implement the #each method can use Enumerable methods, which will then yield each item in the collection to a block.

It can also be said that "Enumerable" is actually a "module", which means it is just a bunch of methods packaged together that can (and do) get "mixed in", or included, with other classes like Array and Hash. It's designed to provide useful functionality to classes representing collections of objects.

# Built With:

This Enumerable method project was built using the Ruby language.

# Getting Started With The Project:

To get started, here below are the steps that needs to be taken in order to achieve the required result from the project:

1. Create a script file to house your methods and run it in IRB to test them later.
2. Add your new methods onto the existing Enumerable module. Ruby makes this easy for you because any class or module can be added to without trouble … just do something like:
  
  module Enumerable
    def my_each
      # your code here
    end
  end

1. Create #my_each, a method that is identical to #each but (obviously) does not use #each. You’ll need to remember the yield statement. Make sure it returns the same thing as #each as well.
2. Create #my_each_with_index in the same way.
3. Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
4. Create #my_all? (continue as above)
5. Create #my_any?
6. Create #my_none?
7. Create #my_count
8. Create #my_map
9. Create #my_inject
10. Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
11. Modify your #my_map method to take a proc instead.
12. Modify your #my_map method to take either a proc or a block. It won’t be necessary to apply both a proc and a block in the same #my_map call since you could get the same effect by chaining together one #my_map call with the block and one with the proc. This approach is also clearer, since the user doesn’t have to remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.

# Contributing:

In this project, your contributions towards helping in improving this project is woild be well accomodated. With that, the project will get better rating and give programmers at any level the ability learn, be inspired and create better content.

After you are done with your contributions, you can: 

i.   Fork The project.
ii.  Create your feature branch using git checkout -b feature/anyfeature(for example)
iii. Commit your changes following git commit -m 'Name it as it pleases you', when you are done,
iv.  Push to the branch you have created using git push origin feature/anyfeature and finally
v.   Open a pull request.

# License:

Distributed under the MIT Licence. See Licence for more informaton

# Contributor(s):

[Kingsley McSimon Ogbonna](https://github.com/KingsleyMcSimon) 

# Link To The Project On Github:

[Enumerable-Methods](https://github.com/KingsleyMcSimon/Enumerable-Methods)

# What Was Learnt During The Project:

I learnt from this project that modules like Enumerable are the ultimate in DRY (Don't Repeat Yourself) code. I also understood that Ruby programmers don't have to write all those methods as mentioned above many different times - they just write them once, package them up as Enumerables and tell Array and Hash to include them.

# Acknowledgements:

[Medium - The Enumerable Module](https://medium.com/yello-offline/ruby-the-enumerable-module-under-the-hood-some-caveats-f640ce39a07d)

[Best ReadMe Template](https://github.com/othneildrew/Best-README-Template)

[The Odin Project - Advanced Building Blocks](https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks)

[Vikings - The Enumerable Module ](https://www.vikingcodeschool.com/falling-in-love-with-ruby/the-enumerable-module)

To as many that supported and guided me towards this project, my regards to them all.
