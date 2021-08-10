class CodesController < ApplicationController
    def new 
        @code = Code.new
    end


    def index
        @smartlock = Smartlock.where(:property_id=>params[:property_id])
        @property =Property.find(params[:property_id])

        @code = @property.smartlock.codes

        
        
        
    end 

    def create
        
        @code = Code.new(params.require(:code).permit(:code,:smartlock_id))

        
        @prop = Smartlock.find_by property_id: @code.property_id
        @code.smartlock_id = @prop.id

        if @code.save
            redirect_to properties_path
        else
            render 'new'
        end 
    end 

    def show
    end


    def destroy
        @code = Code.find(params[:id])
        
        if @code.destroy
            redirect_to properties_path
        else
            render 'new'
        end
    end 
end
