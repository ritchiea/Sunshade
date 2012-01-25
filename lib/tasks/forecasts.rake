namespace :check do
  desc "Calls method to check all forecasts and sets Cities' booleans"
  task :forecasts_and_set_bools => :environment do
    City.check_all_forecasts_and_set_bools
    puts "Forecast check complete!"
  end
  desc "Calls method to check City booleans and send notification emails"
  task :bool_and_email => :environment do
    City.check_bool_and_send_sunshade_emails
    puts "User emails sent!"
  end

  desc "Runs necessary daily task of checking forecasts and notifying users"
  task :dailies => [:forcasts_and_set_bools, :bool_and_email]

end