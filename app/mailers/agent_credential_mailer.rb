class AgentCredentialMailer < ApplicationMailer
    def agent_credentials_email

        @agent = params[:agent]
        mail(to: @agent.email , subject: "You account Details")

    end 
end
