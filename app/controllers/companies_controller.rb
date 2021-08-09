class CompaniesController < ApplicationController

    def index
        @companies=Company.first
    end
    def new 
        @company= Company.new()
    end 
    def create 
        @company = Company.new(params.require(:company).permit(:company_name,:company_contact,:company_address))
        
        
        if @company.save
        redirect_to new_agent_registration_path()

        else
            render 'new'
        end
    end
end
