# Preview all emails at http://localhost:3000/rails/mailers/token_sender
class TokenSenderPreview < ActionMailer::Preview
  def token_email
    TokenSender.token_email(Token.first, 'alla@gmail.com')
  end
end
