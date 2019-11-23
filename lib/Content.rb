require_relative 'A_User'

module Content
    def self.review_content
        return {
            "id" => "3",
            "reviewee" => AUser.receiver,
            "content" => "Very good tutor",
            "review_stars" => "4",
            "user_id" => AUser.sender[:id]
        }
    end
    
    def self.booking_content
        return {
            "id" => "4",
            "date" => DateTime.now,
            "location" => {
                "longitude" => "-6.243153391200242",
                "latitude" => "53.348738600000004"
            },
            "user_id" => AUser.sender[:id],
            "user_booked" => AUser.receiver
        }
    end
    
    def self.inbox_content
        return {
            "id" => "5",
            "message_to" => AUser.receiver,
            "message_from" => AUser.sender,
            "status" => "unread",
            "user_id" => AUser.sender[:id],
            "message_content" => "Hi, I will like to book you for a session."
        }
    end
end