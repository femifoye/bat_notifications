require_relative 'Notification'


module BasicNotificationDecorator
    
    def self.set_action(action)
        @action = action
    end
    
    def self.init_basic_decorator
        set_action("Basic Notification")
        @basicNotification = BasicNotification.new(@action, "Sender", "Receiver", "Message" )
    end
    
    
    def self.get_basic_notification_action
        init_basic_decorator
        return @basicNotification.get_action
    end
    
    def self.get_basic_notification_sender
        init_basic_decorator
        return @basicNotification.get_sender
    end
    
    def self.get_basic_notification_receiver
        init_basic_decorator
        return @basicNotification.get_receiver
    end
    
    def self.get_basic_notification_content
        init_basic_decorator
        return @basicNotification.get_content
    end
    
    def self.get_basic_notification_base
        init_basic_decorator
        return @basicNotification.get_notification_base
    end
    
    
    
end

