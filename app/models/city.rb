class City < ActiveRecord::Base
  has_many :users
  
  validates_presence_of :name

  # TODO: write a custom validation that queries the weather API and checks for city presence
    
  def rainy_today?
    self.rainy_today == true
  end
  
  def self.check_all_forecasts_and_set_bools
    cities = City.all
    cities.each do |z|
      if z.check_for_rain
        z.rainy_today = true
      elsif !z.check_for_rain
        z.rainy_today = false
      end
    end
  end
  
  def self.check_bool_and_send_sunshade_emails
    cities = City.all
    cities.each do |z|
      if z.rainy_today?
        z.email_sunshade_reminder
      end
    end
  end
  
  def email_sunshade_reminder
    users = self.users.all
    users.each do |u|
      UserMailer.sunshade_email(u).deliver
    end
  end
  
  # Checks weather at 1pm
  # TODO: brainstorm a better rain checker
  # perhaps check at several times during today and any 1 "yes" returns true
  
  # BUG: currently considers all precipitation "wet" thus snow will trigger rainy_today
  # return to weather API and sort out greater specificity 
  
  def check_for_rain
    city_forecast = self.set_city_and_measure
    is_forecast_wet = city_forecast.wet?("13:00",25)
  end
 
  def set_city_and_measure
    city = Barometer.new("#{self.name}")
    full_forecast = city.measure
  end

end
