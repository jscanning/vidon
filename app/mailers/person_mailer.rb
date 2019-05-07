class PersonMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.person_mailer.account_activation.subject
  #
  def account_activation(person)
    @person = person
    mail to: person.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.person_mailer.password_reset.subject
  #
  def sub_notice(person)
    @person = person
    mail to: person.email, subject: "Subscription notice"
  end
end
