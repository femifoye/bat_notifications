require_relative 'Notification'
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
        set_action("Booking")
        set_content
        set_sender
        set_receiver
        @bookingNotification = BookingNotification.new( @action, @sender, @receiver, @content )
    end
    
    def self.get_booking_action
        init_booking_decorator
        return @bookingNotification.get_action
    end
    
    def self.get_booking_content
        init_booking_decorator
        content = @bookingNotification.get_content
        booking_location = content["location"]
        return true if booking_location
    end
    
    def self.get_booking_creator
        init_booking_decorator
        return @bookingNotification.get_sender["lastname"]
    end
    
    def self.get_user_booked
        init_booking_decorator
        return @bookingNotification.get_receiver["lastname"]
    end
    
    def self.send_notification
        init_booking_decorator
        return @bookingNotification.send_notification
    end

end



