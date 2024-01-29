# app/mailers/application_mailer.rb

class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"  # Ensure this line is present to set the default layout
end
