class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
        #  before_validation :add_agent_to_company 
        after_create:send_subagent_email

         belongs_to :company ,optional:true
         has_many :properties, through: :company


        def send_subagent_email
          if self.role=="Non-admin"
            @agent = self 
            SendCodeMailer.with(agent:@agent).agent_credentials_email.deliver_now 
            
            

          end 

        

        end
        

end
