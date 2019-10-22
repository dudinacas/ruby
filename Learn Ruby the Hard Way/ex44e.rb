class Other

  def override()
    puts "OTHER override()"
  end

  def implicit()
    puts "OTHER implicit()"
  end

  def altered()
    puts "OTHER altered()"
  end
end

class Child

  def initialize()
    @other = Other.new() # Child has-a Other under @other
  end

  def implicit()
    @other.implicit() # calls other, no inheritance
  end

  def override()
    puts "CHILD override()" # does not call other
  end

  def altered()
    puts "CHILD, BEFORE OTHER altered()"
    @other.altered() # calls other, no inheritance
    puts "CHILD, AFTER OTHER altered()"
  end
end

son = Child.new()

son.implicit()
son.override()
son.altered()
