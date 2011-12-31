class City < ActiveRecord::Base
  has_many :users
  
#  validates_presence_of :name

  
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
  
  # write a method that sets a location to a variable
  # checks .wet? for every hour during the workday on that variable
  # if true then set rainy_today true
  # if never true then set rainy_today false
  
  def check_all_forecasts
    cities = City.all
    cities.each do |z|
      city = z.set_city_and_measure
      report = city.check_for_rain
    end
  end
  
  def check_for_rain
    city_forecast = self.set_city_and_measure
    forecast_wet = city_forecast.wet?("9:00",25)
    return forecast_wet
  end
 
  def set_city_and_measure
    city = Barometer.new("#{self.name}")
    full_forecast = city.measure
    return full_forecast
  end


end
