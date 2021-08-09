class CheckinController < ApplicationController
    def new
        @checkin = Checkin.new
    end 


    def create
        @checkin = Checkin.new(params.require(:checkin).permit(:serial_code,:property_id,:renter_id))
        @checkin.property_id = params[:property_id]
        @checkin.renter_id = current_renter.id

        if @checkin.save
            
            
            @smart_id = Smartlock.where(:property_id=> @checkin.property_id)
            @code= Code.where(:smartlock_id => @smart_id).first.includes(:renter)
                  
                SendCodeMailer.with(code: @code).send_code_email.deliver_now 
            
            render 'index'
            
        else
            render 'new'
        end 


    end 

    def show
       
    end

    def index
        @checkin = Checkin.where(:property_id => params[:property_id]).includes(:property,:renter)
    end
end
