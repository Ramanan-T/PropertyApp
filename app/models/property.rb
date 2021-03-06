class Property < ApplicationRecord
    belongs_to:company 
    has_many_attached :image, :dependent: :destroy

    validate :image_type 
    
def thumbnail input
    return self.images[input].variant(resize: '200X200!').processed
end


end

    private 
    def image_type
        if images.attached? == false
            errors.add(:images, "missing")
        end
        images.each do |image|
            if !image.content_type.in?(%('image/jpeg image/png'))
                errors.add(:images , "should be jpeg or png")
            end
        end
    end

    
end
