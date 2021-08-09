class PropertiesController < ApplicationController
    def new
        @property= Property.new
    end 

    def create
        
        @property = Property.new(params.require(:property).permit(:property_name,:property_desc,:property_price,:property_address,images:[]))
        @property.company_id= current_agent.company_id

        if @property.save 
            redirect_to properties_path
        else
            render 'new'
        end 
    end

    def show
        @property = Property.find(params[:id])

    end

    def index
        @property= Property.all
    end 

    def destroy
        @property = Property.find(params[:id])
        @property.destroy
    end
end
