# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class OrgMailerPreview < ActionMailer::Preview
  def welcome_email
    OrgMailer.welcome_email(Organization.first)
  end
end
