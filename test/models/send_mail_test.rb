require 'test_helper'

class SendMailTest < ActiveSupport::TestCase
  test "Enviar mail ok" do
    ResumeMail.resume_email('pruebasmailror@gmail.com',"").deliver_now
    mail = ActionMailer::Base.deliveries.last
    
    assert_equal 'pruebasmailror@gmail.com', mail['from'].to_s
    
    assert_equal 'pruebasmailror@gmail.com', mail['to'].to_s
  
  end
end
