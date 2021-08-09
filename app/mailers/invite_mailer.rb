class InviteMailer < ApplicationMailer

    def new_invite_email
        @invite =params[:invite]



    mail(to: "ramananaustin@gmail.com", subject: "You got a new invite!")
    end 
end
