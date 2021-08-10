class Smartlock < ApplicationRecord
    belongs_to:property,optional: true
    has_many:codes , dependent: :destroy
    
    
    validates_uniqueness_of :serial_num

    after_create:add_codes_to_smartlock

    private
    def add_codes_to_smartlock
        for i in 0..9 do
            newcode= rand(10 ** 6)
            
            Code.create!(:code=>newcode,:smartlock_id=>self.id)
            
        end
    end

end
