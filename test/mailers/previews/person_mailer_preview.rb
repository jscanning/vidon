# Preview all emails at http://localhost:3000/rails/mailers/person_mailer
class PersonMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/person_mailer/account_activation
  def account_activation
    PersonMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/person_mailer/password_reset
  def password_reset
    PersonMailer.password_reset
  end

end
