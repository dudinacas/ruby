## Animal is-a object look at the extra credit
class Animal
  def greeting
    puts "#@name: Sup, I'm an animal"
  end
end

## Dog is-a animal
class Dog < Animal

  def initialize(name)
    ## Dog instance has-a name
    @name = name # sets name argument to instance variable
  end

  def emote
    puts "#@name: Woof!"
  end
end

## Cat is-a animal
class Cat < Animal

  def initialize(name)
    ## Cat instance has-a name
    @name = name
  end

  def emote
    puts "#@name: Meow!"
  end
end

## Person is-a object
class Person

  def initialize(name)
    ## Person instance has-a name
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
  end

  attr_accessor :pet # lets pet variable be edited
end

## Employee is-a person
class Employee < Person

  def initialize(name, salary)
    ## calls the name method in Person class
    super(name)
    ## Person has-a salary
    @salary = salary
  end

  def flex
    puts "#@name: Yeah, I make $#@salary a year. So what?"
  end

end

## Fish is-a object
class Fish
end

## Salmon is-a Fish
class Salmon < Fish
end

## Halibut is-a Fish
class Halibut < Fish
end


## rover is-a Dog
rover = Dog.new("Rover") # name is Rover

## satan is-a Cat
satan = Cat.new("Satan")

## mary is-a Person
mary = Person.new("Mary")

## mary has-a Pet satan
mary.pet = satan

## frank is-a Employee
frank = Employee.new("Frank", 120000)

## frank has-a Pet rover
frank.pet = rover

## flipper is-a Fish
flipper = Fish.new()

## crouse is-a Salmon
crouse = Salmon.new()

## harry is-a Halibut
harry = Halibut.new()

frank.pet.greeting
mary.pet.emote
frank.pet.emote
frank.flex
