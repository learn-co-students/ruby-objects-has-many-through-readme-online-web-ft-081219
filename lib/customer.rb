class Customer
  attr_accessor :name, :age 
  @@all = []
  
  def initialize(name,age)
    @name = name 
    @age = age 
    @@all << self 
  end
  
  def self.all 
    @@all 
  end
  def new_meal(waiter,total,tip=0)
  Meal.new(waiter,self,total,tip)
end
#don't need to take in customer because you can just use self as the current customers instance.
def meals 
  Meal.all.select do |meal|
    meal.customer == self 
  end
end
  #iterating through every instance of Meal and returning only the ones whos meals custmer matches the current customers instance. if a customer "Rachel" wants to know about all her meals you just call on this class
 def waiters 
   meals.map do |meal| 
     meal.waiter 
   end
  end
end