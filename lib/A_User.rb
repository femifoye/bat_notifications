module AUser
    def self.sender
        return {
            "id" => "3",
            "email" => "house16studio@gmail.com",
            "firstname" => "John",
            "lastname" => "Sender",
            "role" => "Student",
            "gender" => "Male",
            "has_profile" => "true",
            "location" => "Dublin"
        }
    end
    
    def self.receiver
        return {
            "id" => "3",
            "email" => "femi.abdul67@gmail.com",
            "firstname" => "John",
            "lastname" => "Receiver",
            "role" => "Tutor",
            "gender" => "Male",
            "has_profile" => "true",
            "location" => "Dublin"
        }
    end
    
    
    
end