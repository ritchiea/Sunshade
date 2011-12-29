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

  
  # write a method that sets a location to a variable
  # checks .wet? for every hour during the workday on that variable
  # if true then set rainy_today true
  # if never true then set rainy_today false

  def select_city(city_name)
    @city = Barometer.new("#{city_name}")
  end

  def check_forecast_for_city
    select_city(name)
  
end
