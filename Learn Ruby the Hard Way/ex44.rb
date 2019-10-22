class Parent

  def override()
    puts "PARENT override()"
  end

  def implicit()
    puts "PARENT implicit()"
  end

  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent

  def override()
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    super() # calls parent function with same name
    puts "CHILD, AFTER PARENT altered()"
  end
end

dad = Parent.new()
son = Child.new()

dad.implicit() # original function
son.implicit() # not an override, calls original

dad.override() # original function
son.override() # overrides with new function

dad.altered() # original function
son.altered() # overrides, but calls old function
