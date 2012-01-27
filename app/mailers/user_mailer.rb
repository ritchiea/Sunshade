class UserMailer < ActionMailer::Base
  default from: "hello@sunshade.me"
  
  def sunshade_email(user)
    @user = user
    mail(:to => user.email, 
    :subject => "It's likely to rain today in #{user.city_name}!")
  end
  
  def signup_email(user)
    @user = user
    mail(:to => user.email,
    :subject => "Confirm your subscription to Sunshade.me")
  end
  
end
