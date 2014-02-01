class ContactMailer < ActionMailer::Base
  default from: "no_reply@ecolightsolution.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_us.subject
  #
  def contact_us(contact)
    @contact = contact
    mail to: "rivera.roberto89@gmail.com", subject: "Contact Us Request"
  end
end
