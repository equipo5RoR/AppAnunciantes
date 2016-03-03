namespace :calidad_anunciantes do
  desc "Envio de mail"
  task send_mail: :environment do
    SendMail.get
  end

  desc "Actualización de la puntuación en la tabla"
  task update_puntuation: :environment do
    UpdatePuntuation.get
  end
end
