require_relative 'Notification'


module SendNotification
    def self.sendBookingNotification
        set_base_and_action("Booking")
        @bookingsNotification = BookingsDecorator.new(@notificationBase, @action, "Femi", "Lanre", "I have booked you for a Session")
        puts @bookingsNotification.message
        puts @bookingsNotification.get_message
    end
    
    def self.sendReviewNotification
        set_base_and_action("Review")
        @bookingsNotification = ReviewDecorator.new(@notificationBase, @action, "Femi", "Lanre", "I have reviewed a Session")
        puts @bookingsNotification.message
        puts @bookingsNotification.get_message
    end
    
    def self.sendMessageNotification
        set_base_and_action("Message")
        @bookingsNotification = InboxDecorator.new(@notificationBase, @action, "Femi", "Lanre", "I have sent you a message")
        puts @bookingsNotification.message
        puts @bookingsNotification.get_message
    end
    
    def self.sendAppNotification
        set_base_and_action("Message")
        @bookingsNotification = AppMessageDecorator.new(@notificationBase, @action, "Femi", "Lanre", "You have a message from BookATutor")
        puts @bookingsNotification.message
        puts @bookingsNotification.get_message
    end
    
    
    
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

SendNotification.init_basic_decorator


#sendNotification = SendNotification.new

# SendNotification.sendBookingNotification
# SendNotification.sendReviewNotification
# SendNotification.sendMessageNotification
# SendNotification.sendAppNotification
