class Smartlock < ApplicationRecord
    belongs_to:property,optional: true
    has_many:codes 
    
    validates_uniqueness_of :serial_num

    after_save :add_codes_to_smartlock

    private
    def add_codes_to_smartlock
        for i in 0..9 do
            newcode= rand(10 ** 6)
            if self.property_id.blank?
                self.property_id=-1;
            end
            Code.create!(:code=>newcode,:smartlock_id=>self.id,:property_id=>self.property_id)
            
        end
    end

end
