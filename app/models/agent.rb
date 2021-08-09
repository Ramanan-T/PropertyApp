class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
        #  before_validation :add_agent_to_company 

         belongs_to :company 
         has_many :properties, through: :company



        #  def add_agent_to_company
        #     puts "inside callback"
            
        #     company = Company.create!(:company_name=>self.company_name,:company_contact=>self.company_contact ,:company_address=>self.company_address )
              
        #       puts "company created"
        #       # self.company_id = @company.id
        #       # self.role ="Admin"
        #         self.update_attribute(:company_id,company.id)
        #         self.update_attribute(:role,"Admin")
              
        #   end

end
