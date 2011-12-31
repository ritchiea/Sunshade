class City < ActiveRecord::Base
  has_many :users
  
#  validates_presence_of :name

  # TODO: write a validation that queries the weather API and checks for city

  attr_accessor :rainy_today
    
  def rainy_today?
    if !!self.rainy_today
      return true
    else
      return false
    end
  end
  
  def self.check_all_forecasts_and_set
    cities = City.all
    cities.each do |z|
      if z.check_for_rain
        z.rainy_today = true
      elsif !z.check_for_rain
        z.rainy_today = false
      end
    end
  end
  
  def check_for_rain
    city_forecast = self.set_city_and_measure
    forecast_wet = city_forecast.wet?("13:00",25)
    return forecast_wet
  end
 
  def set_city_and_measure
    city = Barometer.new("#{self.name}")
    full_forecast = city.measure
    return full_forecast
  end

end
