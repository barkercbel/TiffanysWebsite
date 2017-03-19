# Preview all emails at http://localhost:3000/rails/mailers/mail_mailer
class MailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_mailer/send_mail
  def send_mail
    MailMailer.send_mail
  end

end
