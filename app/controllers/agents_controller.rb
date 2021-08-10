class AgentsController < ApplicationController
   
    def new
        @agent =Agent.new
    end 
    def create
        @agent= Agent.new(params.require(:agent).permit(:name,:email,:phone,:company_id,:role))
        @agent.role=nil
        @agent.password=params[:email].split('@',2)[0]
        @agent.password_confirmation=@agent.password 

        if @agent.save
            redirect_to properties_path
        else
            render 'new'
        end 


    end

    def addagents
        @agent=Agent.new()
      end
end
