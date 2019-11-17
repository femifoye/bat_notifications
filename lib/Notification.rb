require 'delegate'

class Notification
   
    
    def message
        return "This is get message from #{@action}"
    end
    
    def read_message
        return "this is read message"
    end
    
    def get_action
        return @action
    end
    
    
    
end

class NotificationDecorator < SimpleDelegator
    def initialize(notificationBase, action, sender, receiver, message)
        super(notificationBase)
        @action = action
        @sender = sender
        @receiver = receiver
        @message = message
    end
    
    def booking_method
        return "this is booking method"
    end

    
    
end

class BasicDecorator < NotificationDecorator
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_message
        return @message
    end
    
    def get_sender
        return @sender
    end
    
    def get_receiver
        return @receiver
    end
    
    def get_action
        return @action
    end
    
    def get_notification_base
        return @notificationBase
    end
end

class BookingsDecorator < NotificationDecorator
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_message
        return @message
    end
end

class ReviewDecorator < NotificationDecorator
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_message
        return @message
    end
end

class InboxDecorator < NotificationDecorator
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_message
        return @message
    end
end

class AppMessageDecorator < NotificationDecorator
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_message
        return @message
    end
end
   