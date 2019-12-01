require_relative 'bat_notifications'
require_relative 'NotificationDb'
require_relative "Content.rb"

require "async"


module BookingNotificationDecorator
    
    def self.set_action(action)
        @action = action
    end
    
        
    def self.set_content
        @content = Content.booking_content
    end
    
    def self.set_sender
        @sender = NotificationDb.get_sender
    end
    
    def self.set_receiver
        @receiver = NotificationDb.get_receiver
    end
    
    
    def self.init_booking_decorator

        set_content
        set_sender
        set_receiver
        @notification = Notification.new(@sender, @receiver, @content)
        @notification = BookingNotification.new(@notification)
    end
    
    def self.get_booking_action
        init_booking_decorator
        return @notification.get_action
    end
    
    def self.get_booking_content
        init_booking_decorator
        content = @notification.get_content
        booking_location = content["location"]
        return true if booking_location
    end
    
    def self.get_booking_creator
        init_booking_decorator
        return @notification.get_sender["lastname"]
    end
    
    def self.get_user_booked
        init_booking_decorator
        return @notification.get_receiver["lastname"]
    end
    
    def self.send_notification
        init_booking_decorator
        return @notification.send_notification_to_receiver
    end
    
    def self.get_user_booking_notification
        init_booking_decorator
        @notification = UserBookingNotification.new(@notification)
    end
    
    def self.get_user_booking_notification_subject
        init_booking_decorator
        @notification = UserBookingNotification.new(@notification)
        return @notification.get_subject
    end
    
    def self.user_send_notification
        init_booking_decorator
        @notification = UserBookingNotification.new(@notification)
        return @notification.send_notification_to_sender
    end
end



