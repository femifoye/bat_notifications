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
end