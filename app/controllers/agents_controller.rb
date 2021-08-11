class AgentsController < ApplicationController
   
    def new
        @agent =Agent.new
    end 
    def create
        @agent= Agent.new(params.require(:agent).permit(:name,:email,:phone,:company_id,:role,:password))
        

        @agent.password= @agent.email.split('@',2)[0]
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

      def destroy 
        @agent = Agent.find(params[:id])

        if @agent.destroy
            redirect_to "Properties_path"
            flash.alert =" Sub Agent has been deleted"
        end
    end
end
