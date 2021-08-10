class SendCodeMailer < ApplicationMailer
    def send_code_email
    
        @property = params[:property]
        mail(to: 'ramananaustin@gmail.com', subject: "You got a new code!")
    end
end
