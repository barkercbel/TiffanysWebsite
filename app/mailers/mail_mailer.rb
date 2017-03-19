class MailMailer < ApplicationMailer

  default from: 'barkercbel@gmail.com'
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #   en.mail_mailer.send_mail.subject
  
  def send_mail (sender_email, message)
    @sender_email = sender_email
    @message = message
    
    @info = Room.find_by(key: "contact")
    mail(to: @info.value, subject: "Contact from artist website")
  end

end
