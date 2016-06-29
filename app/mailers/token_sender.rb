class TokenSender < ApplicationMailer

  def send_token_email(token, email)
    @token = token.guid
    mail(to: email, subject: 'Sample Email')
  end
end
