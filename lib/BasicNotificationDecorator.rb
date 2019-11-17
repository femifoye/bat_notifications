require_relative 'Notification'


module BasicNotificationDecorator
    
    
    def self.get_notification_base
        @notificationBase = Notification.new
        return @notificationBase
    end
    
    def self.set_action(action)
        @action = action
    end
    
    def self.set_base_and_action(action)
        get_notification_base
        set_action(action)
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
    
    def self.get_basic_notification_message
        init_basic_decorator
        return @basicNotification.get_message
    end
    
    def self.get_basic_notification_base
        init_basic_decorator
        return @basicNotification.get_notification_base
    end
    
    def self.init_basic_decorator
        set_base_and_action("Basic Notification")
        @basicNotification = BasicDecorator.new(@notificationBase, @action, "Sender", "Receiver", "Message" )
    end
    
    
end

