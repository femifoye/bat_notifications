require_relative 'A_User'

module NotificationDb
    def self.get_sender
        return AUser.sender
    end
    
    def self.get_receiver
        return AUser.receiver
    end
    
end