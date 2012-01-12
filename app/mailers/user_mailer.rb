class UserMailer < ActionMailer::Base
  default from: "info@sunshade.me"
  
  def sunshade_email(user)
    @user = user
    mail(:to => user.email, 
    :subject => "It's going to rain today in #{user.city_name}!")
  end
  
  # TODO: write welcome email
  
end
