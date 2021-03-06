class Image < ApplicationRecord
    belongs_to :post
    has_one_attached :uploaded_image
    
    # show num of imgs sitewide 
    def self.total_num_images
        self.all.count
    end
    # display image create date
    def create_date
        date = self.uploaded_image.created_at
        date.strftime("%B %d, %Y")
    end

end
