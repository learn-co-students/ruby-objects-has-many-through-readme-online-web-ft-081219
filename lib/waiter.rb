class Waiter
attr_accessor :name, :yrs_experience 
@@all = []

def initialize(name, yrs_experience)
  @name = name 
  @yrs_experience = yrs_experience
  @@all << self 
end

def self.all 
  @@all 
end
 def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end
  
  def meals 
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end
  
  def best_tipper 
   best_tipped_meal = meals.max do |meal_a, meal_b|
     meal_a.tip <=> meal_b.tip 
   end
   #finds the maximum tip from meals array created by the meals method when comparind the meals tips
   best_tipped_meal.customer
  end
  #will give you the result of the individual customer if you do best_tipped_meal.customer.name would just give you the name. 
end