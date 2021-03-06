# User -< Favs >- Post / #through fav?  

class User < ApplicationRecord
    has_many :posts, dependent: :destroy  
    has_many :comments, dependent: :destroy  
    has_many :favs, dependent: :destroy  

    has_secure_password

    validates :email, uniqueness: true, presence: true
    validates :location, presence: true
    validates :address, presence: true
    validates :zip_code, presence: true
    validates :phone_number, presence: true
    validates :name, presence: true
    # location options for user create form
    def self.location_options
        [
            ["East Rock"], # what other off-campus areas?
            ["Yale College: Old Campus", "Old Campus"],
            ["Yale College: Benjamin Franklin", "Benjamin Franklin"],
            ["Yale College: Berkeley", "Berkeley"],
            ["Yale College: Branford", "Branford"],
            ["Yale College: Davenport", "Davenport"],
            ["Yale College: Ezra Stiles", "Ezra Stiles"],
            ["Yale College: Grace Hopper", "Grace Hopper"],
            ["Yale College: Jonathan Edwards", "Jonathan Edwards"],
            ["Yale College: Morse", "Morse"],
            ["Yale College: Pauli Murray", "Pauli Murray"],
            ["Yale College: Pierson", "Pierson"],
            ["Yale College: Saybrook", "Saybrook"],
            ["Yale College: Silliman", "Silliman"],
            ["Yale College: Timothy Dwight", "Timothy Dwight"],
            ["Yale College: Trumball", "Trumball"],
            ["Other"]
        ]
    end
    # return number of posts user has faved
    def num_faved_posts
        self.favs.count
    end
    # return array of all posts faved by user
    def faved_posts
        # self.posts.map { |post| post.is_fav?(self) }
        self.favs.map {|fav| fav.post }
    end
    # display total users signed up with Yarket
    def self.total_num_users
        self.all.count
    end
    # orders an array of user's posts by most recent
    def order_by_most_recent
        self.all.order(created_at: :desc)
    end
    # display when user was created
    def create_date
        date = self.created_at
        date.strftime("%B %d, %Y")
    end
end
