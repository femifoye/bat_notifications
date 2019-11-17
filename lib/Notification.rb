require 'delegate'

# class Notification
   
    
#     def message
#         return "This is get message from #{@action}"
#     end
    
#     def read_message
#         return "this is read message"
#     end
    
#     def get_action
#         return @action
#     end
    
    
    
# end

class NotificationDecorator < SimpleDelegator
    def initialize(action, sender, receiver, content)
        #super(notificationBase)
        @action = action
        @sender = sender
        @receiver = receiver
        @content = content
    end
    
    def booking_method
        return "this is booking method"
    end

    def get_content
        return @content
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

class BasicNotification < NotificationDecorator
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
  
end

class BookingsNotification < NotificationDecorator
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_content
        return @content
    end
end

class ReviewNotification < NotificationDecorator
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_content
        return @content
    end
end

class InboxNotification < NotificationDecorator
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_content
        return @content
    end
end

class AppMessageNotification < NotificationDecorator
    def message
        return "You have a new #{@action} from #{@sender}. Check out the details"
    end
    
    def get_content
        return @content
    end
end
   