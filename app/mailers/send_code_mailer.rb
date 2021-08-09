class SendCodeMailer < ApplicationMailer
    def send_code_email
    
        @code = params[:code]
        mail(to: 'ramananaustin@gmail.com', subject: "You got a new order!")
    end
end
