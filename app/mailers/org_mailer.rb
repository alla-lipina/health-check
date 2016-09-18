class OrgMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(organization)
    @organization = organization
    @url  = 'http://example.com/login'
    mail(to: @organization.email, subject: 'Welcome to My Awesome Site')
  end
end
