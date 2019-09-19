class Waiter
  attr_accessor :name , :years
  @@all = []
  
  def initialize(name, years)
    @name = name
    @years = years
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def new_meal(customer, total, tip)
    Meal.new(self,customer,total, tip)
  end 
  
  def meals
    Meal.all.find_all{ |meal| meal.waiter == self}
  end
  
  def best_tipper 
    self.meals.sort_by{|meal| meal.tip}.last.customer
  end
end