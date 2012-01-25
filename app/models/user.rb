class User < ActiveRecord::Base
  
  belongs_to :city

  validates_presence_of :email
  validates_presence_of :password, :on => :create, :message => "Password can't be blank!"
  validates_uniqueness_of :email
  validates_confirmation_of :password
  
  attr_accessor :password
  before_save :encrypt_password

  def city_name
    self.city.name if self.city.present?
  end
  
  def city_name=(string)
    self.city = City.find_or_create_by_name(string)
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  

end
