class AirlineClass

  def initialize(cost)
    @cost = cost
  end
end

class FirstClass < AirlineClass
end

class BusinessClass < AirlineClass
end

class EconomyClass < AirlineClass
end
