class Waiter
  attr_accessor :name
  
  @@all = []

def initialize(name, years_of_experience)
  @name = name
  
  @@all << self
end

def self.all
  @@all
end

def new_meal(customer, total, tip)
  Meal.new(self, customer, total, tip)
end

def meals
  Meal.all.select do |meal|
    meal.waiter == self
  end
end

def best_tipper
 tipper = meals.max do |a, b|
    a.tip <=> b.tip
  end
  tipper.customer
end
end