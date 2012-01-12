class User < ActiveRecord::Base
  belongs_to :city

  validates_presence_of :email
  validates_uniqueness_of :email
  
  attr_accessor :email

  def city_name
    self.city.name if self.city.present?
  end
  
  def city_name=(string)
    self.city = City.find_or_create_by_name(string)
  end

end
