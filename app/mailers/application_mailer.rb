class ApplicationMailer < ActionMailer::Base
  # Definimos un correo por defecto
  default from: "pruebasmailror@gmail.com"
  layout 'mailer'
end
