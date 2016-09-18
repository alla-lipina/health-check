class TokenSender < ApplicationMailer
  # default from: 'tokens@example.com'
 
  def token_email(token, email)
    @token = token.guid
    mail(to: email, subject: 'Sample Email')
  end
end
