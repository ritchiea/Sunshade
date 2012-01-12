class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def rain_email(user)
    @user = user
    mail(:to => user.email, 
    :subject => "It's going to rain today in #{user.city_name}!")
  end
  
  
end
