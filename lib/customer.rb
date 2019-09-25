class Customer
  attr_accessor :name
  
  @@all = []
  
  def initialize(name, age)
    @name = name
    @age = age
    
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end
  
  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end
  
  def waiters
    meals.map do |meals|
      meals.waiter
    end
  end
end