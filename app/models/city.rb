class City < ActiveRecord::Base
  has_many :users
  
  validates_presence_of :name
  
  # TODO: write a validation that queries the weather API and checks for city
  
  # attr_accessor for rainy_today is necessary for weather API methods
  attr_accessor :rainy_today
    
  def rainy_today?
    if !!self.rainy_today
      return true
    else
      return false
    end
  end
  
end
